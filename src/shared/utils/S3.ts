import { S3 } from 'aws-sdk';
import { randomBytes } from 'crypto';

export default async function uploadPicS3(image: Buffer) {
  const s3 = new S3();

  const token = randomBytes(32).toString('hex');
  const uploadResult = await s3
    .upload({
      Bucket: process.env.AWS_PUBLIC_BUCKET_NAME,
      Body: image,
      Key: token,
    })
    .promise();

  return uploadResult.Location
}
