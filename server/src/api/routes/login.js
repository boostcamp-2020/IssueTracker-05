import { Router } from 'express';
import passport from 'passport';

import loginController from '@api/controllers/login';

export default (app) => {
  const route = Router();

  app.use('/login', route);

  route.post('/', loginController.localLogin);
  route.get('/github', loginController.github);
  route.get('/github/callback',
    passport.authenticate('github', { failureRedirect: '/login' }),
    function(req, res) {
      // Successful authentication, redirect home.
      res.redirect('/');
    });
};
