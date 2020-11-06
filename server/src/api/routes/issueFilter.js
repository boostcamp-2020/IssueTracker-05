import { Router } from 'express';

import passportJwtMiddleware from '@api/middlewares/passportJwt';
import issueFilterController from '@api/controllers/issueFilter';

export default (app) => {
  const route = Router();

  app.use('/filter', route);

  route.use(passportJwtMiddleware);

  route.post('/list');
  route.post('/search', issueFilterController.searchIssue);
};
