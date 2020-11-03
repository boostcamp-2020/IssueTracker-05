import dotenv from 'dotenv';

const envFound = dotenv.config();

if (envFound.error) {
  throw new Error(" Couldn't find .env file ");
}

export default {
  secretOrKey: process.env.JWT_SECRET_KEY,
  githubClientId: process.env.GITHUB_ID,
  githubClientSecret: process.env.GITHUB_SECRET,
  githubCallbackURL: `http://localhost:${process.env.PORT}/${process.env.GITHUB_CALLBACK_URL}`,
  appleClientId: process.env.Apple_ID,
  appleClientSecret: process.env.Apple_SECRET,
  appleCallbackURL: `http://localhost:${process.env.PORT}/${process.env.APPLE_CALLBACK_URL}`,
};
