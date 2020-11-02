import { Router } from 'express';

import issueController from '@api/controllers/issue';

export default (app) => {
  const route = Router();

  app.use('/issue', route);

//   route.get('/', issueController.getIssues);
  route.get('/:id', issueController.getIssue);
//   route.post('/', issueController.createIssue);
//   route.patch('/:id', issueController.updateIssue);
//   route.delete('/:id', issueController.deleteIssue);
};
