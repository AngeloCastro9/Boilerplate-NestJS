import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AdminModule } from './admin/admin.module';
import { AuthModule } from './auth/auth.module';
import { AdminController } from './admin/admin.controller';
import { PrismaService } from './database/prisma.service';
import { ConfigModule } from '@nestjs/config';
import { AuthController } from './auth/auth.controller';

@Module({
  imports: [
    AdminModule,
    AuthModule,
    ConfigModule.forRoot({ isGlobal: true }),
  ],
  controllers: [AppController, AdminController, AuthController],
  providers: [AppService, PrismaService],
})

export class AppModule { }
