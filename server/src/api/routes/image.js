import { Router } from 'express';

import multer from 'multer';
import ImgurStorage from 'multer-storage-imgur';
import imageController from '@api/controllers/image';

export default (app) => {
  const route = Router();
  const upload = multer({
    storage: ImgurStorage({ clientId: 'fa16234a61b3af6' }),
  });
  app.use('/image', route);

  route.post('/upload', upload.single('img'), imageController.imageUpload);
};
