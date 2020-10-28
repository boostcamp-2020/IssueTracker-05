import { Router } from 'express';

import loginController from '../controllers/login';

export default (app) => {
  const route = Router();

  app.use('/login', route);

  route.get('/', loginController.login);
};
