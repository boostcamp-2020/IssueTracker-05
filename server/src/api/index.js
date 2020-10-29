import { Router } from 'express';

import login from './routes/login';
import signup from '@api/routes/signup';

export default () => {
  const app = Router();

  login(app);
  signup(app);

  return app;
};
