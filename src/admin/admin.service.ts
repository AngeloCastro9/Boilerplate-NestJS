import {
  BadRequestException,
  HttpException,
  Injectable,
  NotAcceptableException,
} from '@nestjs/common';
import { admin, Prisma } from '@prisma/client';
import { PrismaService } from '../database/prisma.service';
import { MailService } from '../mail/service/mail.service';

@Injectable()
export class AdminService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly mail: MailService,
  ) {}

  async create(data: Prisma.adminCreateInput): Promise<admin> {
    const admin = await this.prisma.admin.findUnique({
      where: {
        email: data.email,
      },
    });

    if (admin) {
      throw new BadRequestException('User already exists');
    }

    const adminCreated = await this.prisma.admin.create({ data });

    await this.mail.sendWelcome(data.email, data.name);

    delete adminCreated.password;

    return adminCreated;
  }

  async readOne(id: number): Promise<admin> {
    try {
      return this.prisma.admin.findUniqueOrThrow({
        where: {
          id,
        },
      });
    } catch (error) {
      throw new HttpException(error, 400);
    }
  }

  async update(data: Prisma.adminUpdateInput, id: number): Promise<admin> {
    try {
      await this.prisma.admin.findUniqueOrThrow({
        where: {
          id,
        },
      });

      return this.prisma.admin.update({
        where: {
          id,
        },
        data,
      });
    } catch (error) {
      throw new HttpException(error, 400);
    }
  }

  async disable(id: number): Promise<admin> {
    try {
      await this.prisma.admin.findUniqueOrThrow({
        where: {
          id,
        },
      });

      return this.prisma.admin.update({
        where: {
          id,
        },
        data: {
          status: 'Block',
        },
      });
    } catch (error) {
      throw new HttpException(error, 400);
    }
  }

  async enable(id: number): Promise<admin> {
    try {
      const admin = await this.prisma.admin.findUniqueOrThrow({
        where: {
          id,
        },
      });

      if (admin.status === 'Activate') {
        throw new NotAcceptableException('Admin already activate');
      }

      return this.prisma.admin.update({
        where: {
          id,
        },
        data: {
          status: 'Activate',
        },
      });
    } catch (error) {
      throw new HttpException(error, 400);
    }
  }
}
