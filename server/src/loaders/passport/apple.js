import AppleStrategy from 'passport-apple';
import db from '@models';
import passportConfig from '@config/passport';

export default new AppleStrategy(
  {
    clientID: passportConfig.appleClientId,
    teamID: '',
    callbackURL: passportConfig.appleCallbackURL,
    keyID: '',
    privateKeyLocation: passportConfig.appleClientSecret,
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
