import { Router } from 'express';

import userController from '@api/controllers/user';
import passportJwt from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();

  app.use('/user', route);

  route.use(passportJwt);

  route.get('/', userController.getUsers);
};
