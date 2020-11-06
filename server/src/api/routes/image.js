import { Router } from 'express';

import multer from 'multer';
import ImgurStorage from 'multer-storage-imgur';
import imageController from '@api/controllers/image';
import passportJwtMiddleware from '@api/middlewares/passportJwt';
import imgurConfig from '@config/imgur';

export default (app) => {
  const route = Router();
  const upload = multer({
    storage: ImgurStorage({ clientId: imgurConfig.clientId }),
  });
  app.use('/image', route);

  route.use(passportJwtMiddleware);

  route.post('/upload', upload.single('img'), imageController.imageUpload);
  route.post('/profile', upload.single('img'), imageController.profileUpload);
};
