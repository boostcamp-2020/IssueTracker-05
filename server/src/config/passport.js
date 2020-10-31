import dotenv from 'dotenv';

const envFound = dotenv.config();

if (envFound.error) {
  throw new Error(" Couldn't find .env file ");
}

export default {
  secretOrKey: process.env.JWT_SECRET_KEY,
  clientId : process.env.GITHUB_ID,
  clientSecret: process.env.GITHUB_SECRET,
  callbackURL: `http://localhost:${process.env.PORT}/${process.env.GITHUB_CALLBACK_URL}`
};
