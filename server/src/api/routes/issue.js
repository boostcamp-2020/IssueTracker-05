import { Router } from 'express';

import issueController from '@api/controllers/issue';
import passportJwtMiddleware from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();

  app.use('/issue', route);

  route.use(passportJwtMiddleware);

  route.get('/', issueController.getIssues);
  route.get('/:id', issueController.getTargetIssue);
  route.post('/', issueController.createIssue);
  // route.patch('/:id', issueController.updateIssue);
  route.delete('/:id', issueController.deleteIssue);
};
