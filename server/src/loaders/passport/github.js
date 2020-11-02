import { Strategy as GitHubStrategy } from 'passport-github2';

import passportConfig from '@config/passport';
import db from '@models';

export default new GitHubStrategy(
  {
    clientID: passportConfig.clientId,
    clientSecret: passportConfig.clientSecret,
    callbackURL: passportConfig.callbackURL,
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
    return done(null, user);
  },
);
