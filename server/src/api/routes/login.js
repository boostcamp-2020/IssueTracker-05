import { Router } from 'express';
import passport from 'passport';

import loginController from '@api/controllers/login';

export default (app) => {
  const route = Router();

  app.use('/login', route);

  route.post(
    '/',
    passport.authenticate('local', { session: false }),
    loginController.localLogin,
  );
  route.get(
    '/github',
    passport.authenticate('github', { scope: ['user: email'] }),
  );
  route.get(
    '/github/callback',
    passport.authenticate('github', { session: false }),
    loginController.githubCallback,
  );
  route.post('/github', loginController.githubAppLogin);
  route.post('/apple', loginController.appleAppLogin);
};
