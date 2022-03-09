/*
  Warnings:

  - You are about to drop the `prisma` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "prisma";

-- CreateTable
CREATE TABLE "admin" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "resetPassCode" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "disabledAt" TIMESTAMP(3),
    "status" "verification" NOT NULL DEFAULT E'Activate'
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_id_key" ON "admin"("id");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "admin_resetPassCode_key" ON "admin"("resetPassCode");
