import { Router } from 'express';

import signupMiddleware from '@api/middlewares/signup';
import signupController from '@api/controllers/signup';

export default (app) => {
  const route = Router();

  app.use('/signup', route);

  route.post('/check-id', signupMiddleware.checkId, signupController.checkId);
  route.post(
    '/',
    signupMiddleware.isValid,
    signupMiddleware.checkId,
    signupController.signup,
  );
};
