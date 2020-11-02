import { Router } from 'express';

import signup from '@api/routes/signup';
import login from '@api/routes/login';
import milestone from '@api/routes/milestone';

export default () => {
  const app = Router();

  login(app);
  signup(app);
  milestone(app);

  return app;
};
