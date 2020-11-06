import passport from 'passport';

import passportLocal from './local';
import passportJwt from './jwt';
import passportGithub from './github';

export default (app) => {
  app.use(passport.initialize());

  passport.use(passportLocal);
  passport.use(passportJwt);
  passport.use(passportGithub);

  console.log('🍗 passport Connect! 🍗');
};
