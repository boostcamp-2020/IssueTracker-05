import { Router } from 'express';

import signup from '@api/routes/signup';
import login from '@api/routes/login';
import milestone from '@api/routes/milestone';
import issue from '@api/routes/issue';

export default () => {
  const app = Router();

  login(app);
  signup(app);
  milestone(app);
  issue(app);

  return app;
};
