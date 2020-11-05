import dotenv from 'dotenv';

const envFound = dotenv.config();

if (envFound.error) {
  throw new Error(" Couldn't find .env file ");
}

export default {
  clientId: process.env.IMGUR_CLIENT_ID,
};
