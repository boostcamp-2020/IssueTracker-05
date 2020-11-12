import { Strategy as GitHubStrategy } from 'passport-github2';

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
    return done(null, {
      uid: user[0].uid,
      userId: user[0].userId,
      nickname: user[0].nickname,
      image: user[0].image,
    });
  },
);
