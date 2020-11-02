import { Router } from 'express';

import labelController from '@api/controllers/label';

export default (app) => {
  const route = Router();

  app.use('/label', route);

  route.post('/', labelController.createLabel);
  route.get('/', labelController.getLabels);
  route.get('/:name', labelController.getLabel);
  route.patch('/:name', labelController.patchLabel);
  route.delete('/:name', labelController.deleteLabel);
};
