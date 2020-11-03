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
  appleClientId: process.env.APPLE_CLIENT_ID,
  appleTeamId: process.env.APPLE_TEAM_ID,
  appleKeyId: process.env.APPLE_KEY_ID,
  applePrivateKey: process.env.APPLE_PRIVATE_KEY,
  appleCallbackURL: `http://localhost:${process.env.PORT}/${process.env.APPLE_CALLBACK_URL}`,
};
