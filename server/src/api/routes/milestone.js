import { Router } from 'express';

import milestoneController from '@api/controllers/milestone';

export default (app) => {
  const route = Router();

  app.use('/milestone', route);

  route.get('/', milestoneController.getMilestone);
  route.delete('/:id', milestoneController.deleteMilestone);
  route.put('/:id', milestoneController.editMilestone);
  route.post('/', milestoneController.addMilestone);
};
