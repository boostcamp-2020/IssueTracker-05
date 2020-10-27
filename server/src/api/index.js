import { Router } from 'express';

import login from './routes/login';

export default () => {
  const app = Router();

  login(app);

  return app;
};
