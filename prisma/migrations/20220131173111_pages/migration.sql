/*
  Warnings:

  - You are about to drop the column `photo` on the `lookbook` table. All the data in the column will be lost.
  - You are about to drop the column `urlReserva` on the `lookbook` table. All the data in the column will be lost.
  - Added the required column `capa` to the `lookbook` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "lookbook" DROP COLUMN "photo",
DROP COLUMN "urlReserva",
ADD COLUMN     "capa" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "lbPages" (
    "id" SERIAL NOT NULL,
    "photo" TEXT NOT NULL,
    "urlReserva" TEXT NOT NULL,
    "lookbookId" INTEGER,

    CONSTRAINT "lbPages_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "lbPages" ADD CONSTRAINT "lbPages_lookbookId_fkey" FOREIGN KEY ("lookbookId") REFERENCES "lookbook"("id") ON DELETE SET NULL ON UPDATE CASCADE;
