/*
  Warnings:

  - You are about to drop the `admin` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `lbPages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `lookbook` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "lbPages" DROP CONSTRAINT "lbPages_lookbookId_fkey";

-- DropTable
DROP TABLE "admin";

-- DropTable
DROP TABLE "lbPages";

-- DropTable
DROP TABLE "lookbook";

-- CreateTable
CREATE TABLE "user" (
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "resetPassCode" TEXT,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "disabledAt" TIMESTAMP(3),
    "status" "verification" NOT NULL DEFAULT E'Activate'
);

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "user_resetPassCode_key" ON "user"("resetPassCode");
