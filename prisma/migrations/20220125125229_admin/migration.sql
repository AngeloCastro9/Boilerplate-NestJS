-- CreateEnum
CREATE TYPE "verification" AS ENUM ('Activate', 'Block');

-- CreateTable
CREATE TABLE "admin" (
    "cpf" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "resetPassCode" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "disabledAt" TIMESTAMP(3),
    "status" "verification" NOT NULL DEFAULT E'Activate'
);

-- CreateTable
CREATE TABLE "lookbook" (
    "id" SERIAL NOT NULL,
    "photo" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "urlReserva" TEXT[],

    CONSTRAINT "lookbook_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_cpf_key" ON "admin"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "admin_name_key" ON "admin"("name");

-- CreateIndex
CREATE UNIQUE INDEX "admin_resetPassCode_key" ON "admin"("resetPassCode");
