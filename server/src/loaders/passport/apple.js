import AppleStrategy from 'passport-apple';
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
        nickname: profile.username,
        OAuth: true,
      },
    });
    return done(null, user);
  },
);
