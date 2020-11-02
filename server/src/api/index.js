import { Router } from 'express';

import signup from '@api/routes/signup';
import login from '@api/routes/login';
import milestone from '@api/routes/milestone';
import issue from '@api/routes/issue';
import comment from '@api/routes/comment';
import label from '@api/routes/label';

export default () => {
  const app = Router();

  login(app);
  signup(app);
  milestone(app);
  issue(app);
  comment(app);
  label(app);

  return app;
};
