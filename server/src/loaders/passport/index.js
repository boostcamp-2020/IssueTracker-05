import passport from 'passport';

import passportLocal from './local';
import passportJwt from './jwt';
import passportGithub from './github';
import passportApple from './apple';

export default (app) => {
  app.use(passport.initialize());

  passport.use(passportLocal);
  passport.use(passportJwt);
  passport.use(passportGithub);
  passport.use(passportApple);

  console.log('🍗 passport Connect! 🍗');
};
