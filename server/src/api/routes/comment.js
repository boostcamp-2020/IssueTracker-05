import { Router } from 'express';

import commentController from '@api/controllers/comment';
import passportJwtMiddleware from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();

  app.use('/comment', route);

  route.use(passportJwtMiddleware);

  route.get('/:iid', commentController.getComments);
  route.post('/', commentController.createComment);
  route.patch('/:cid', commentController.patchComment);
  route.delete('/:cid', commentController.deleteComment);
};
