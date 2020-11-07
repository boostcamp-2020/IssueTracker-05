import { Strategy as GitHubStrategy } from 'passport-github2';
import jwt from 'jsonwebtoken';

import passportConfig from '@config/passport';
import db from '@models';

export default new GitHubStrategy(
  {
    clientID: passportConfig.githubClientId,
    clientSecret: passportConfig.githubClientSecret,
    callbackURL: passportConfig.githubCallbackURL,
  },
  async (accessToken, refreshToken, profile, done) => {
    const user = await db.user.findOrCreate({
      where: {
        userId: profile.id,
        resourceServer: profile.provider,
        nickname: profile.username,
        OAuth: true,
      },
    });
    const token = jwt.sign(user[0].toJSON(), passportConfig.secretOrKey);
    return done(null, { user, token, profile });
  },
);
