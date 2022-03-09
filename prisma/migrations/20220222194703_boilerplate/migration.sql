/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "user";

-- CreateTable
CREATE TABLE "prisma" (
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
CREATE UNIQUE INDEX "prisma_id_key" ON "prisma"("id");

-- CreateIndex
CREATE UNIQUE INDEX "prisma_email_key" ON "prisma"("email");

-- CreateIndex
CREATE UNIQUE INDEX "prisma_resetPassCode_key" ON "prisma"("resetPassCode");
