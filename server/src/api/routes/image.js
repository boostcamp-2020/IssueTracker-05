import { Router } from 'express';

import multer from 'multer';
import ImgurStorage from 'multer-storage-imgur';
import imageController from '@api/controllers/image';
import passportJwtMiddleware from '@api/middlewares/passportJwt';

export default (app) => {
  const route = Router();
  const upload = multer({
    storage: ImgurStorage({ clientId: 'fa16234a61b3af6' }),
  });
  app.use('/image', route);

  route.use(passportJwtMiddleware);

  route.post('/upload', upload.single('img'), imageController.imageUpload);
};
