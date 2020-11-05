import { Router } from 'express';

import labelController from '@api/controllers/label';
import passportJwtMiddleware from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();

  app.use('/label', route);

  route.use(passportJwtMiddleware);

  route.post('/', labelController.createLabel);
  route.get('/', labelController.getLabels);
  route.get('/:name', labelController.getLabel);
  route.patch('/:name', labelController.patchLabel);
  route.delete('/:name', labelController.deleteLabel);
};
