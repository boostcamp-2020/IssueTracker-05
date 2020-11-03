import AppleStrategy from 'passport-apple';
import db from '@models';
import passportConfig from '@config/passport';

export default new AppleStrategy(
  {
    clientID: passportConfig.appleClientId,
    teamID: passportConfig.appleTeamId,
    callbackURL: passportConfig.appleCallbackURL,
    keyID: passportConfig.appleKeyId,
    privateKeyLocation: passportConfig.applePrivateKey,
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
