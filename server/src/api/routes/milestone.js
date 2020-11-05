import { Router } from 'express';

import milestoneController from '@api/controllers/milestone';
import passportJwtMiddleware from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();

  app.use('/milestone', route);

  route.use(passportJwtMiddleware);

  route.get('/', milestoneController.getMilestone);
  route.delete('/:id', milestoneController.deleteMilestone);
  route.patch('/:id', milestoneController.editMilestone);
  route.post('/', milestoneController.addMilestone);
};
