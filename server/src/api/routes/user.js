import { Router } from 'express';

import userController from '@api/controllers/user';

export default (app) => {
  const route = Router();

  app.use('/user', route);

  route.get('/', userController.getUsers);
};
