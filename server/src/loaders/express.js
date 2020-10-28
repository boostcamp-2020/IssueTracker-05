import { json, urlencoded } from 'express';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import createError from 'http-errors';
import logger from 'morgan';

import routes from '../api';
import expressConfig from '../config/express';

export default async (app) => {
  app.use(logger('dev'));

  // CORS 옵션 설정
  app.use(cors(expressConfig.corsOption));

  app.use(json());
  app.use(urlencoded({ extended: false })); // extended false or true
  app.use(cookieParser());

  app.get('/status', (req, res) => {
    return res.status(200).end();
  });

  // 라우터 설정
  app.use(expressConfig.prefix, routes());

  app.use((req, res, next) => {
    return next(createError(404, 'Not Found'));
  });

  // eslint-disable-next-line no-unused-vars
  app.use((err, req, res, next) => {
    return res.status(err.status).json({ message: err.message });
  });
};
