import { Router } from 'express';

import signup from '@api/routes/signup';
import login from '@api/routes/login';
import milestone from '@api/routes/milestone';
import issue from '@api/routes/issue';
import comment from '@api/routes/comment';
import label from '@api/routes/label';
import issueFilter from '@api/routes/issueFilter';

export default () => {
  const app = Router();

  login(app);
  signup(app);
  milestone(app);
  issue(app);
  comment(app);
  label(app);
  issueFilter(app);

  return app;
};
