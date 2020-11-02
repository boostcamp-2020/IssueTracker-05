import { Router } from 'express';

import signup from '@api/routes/signup';
import login from '@api/routes/login';
import milestone from '@api/routes/milestone';
import comment from '@api/routes/comment';
import label from '@api/routes/label';

export default () => {
  const app = Router();

  login(app);
  signup(app);
  milestone(app);
  comment(app);
  label(app);

  return app;
};
