import { Router } from 'express';

import commentController from '@api/controllers/comment';

export default (app) => {
  const route = Router();

  app.use('/comment', route);

  route.post('/', commentController.createComment);
  route.patch('/:comment', commentController.patchComment);
  route.delete('/:comment', commentController.deleteComment);
};
