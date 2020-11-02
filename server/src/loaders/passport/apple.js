import AppleStrategy from 'passport-apple';

import passportConfig from '@config/passport';
import db from '@models';

export default new AppleStrategy(
  {
    clientID: '',
    teamID: '',
    callbackURL: '',
    keyID: '',
    privateKeyLocation: '',
    passReqToCallback: true,
  },
  async (req, accessToken, refreshToken, decodedIdToken, profile, done) => {
    const user = await db.user.findOrCreate({
      where: {
        userId: profile.id,
        resourceServer: 'apple',
        OAuth: true,
        nickname: profile.id,
      },
    });
    return done(null, user);
  },
);
