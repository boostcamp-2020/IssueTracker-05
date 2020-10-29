import express from 'express';

import server from '@loaders';
import serverConfig from '@config/server';

const startServer = async () => {
  const app = express();

  await server(app);

  app.listen(serverConfig.port, () =>
  {
    console.log(
      `Example app listening at http://localhost:${serverConfig.port}`
    );
  });
};

startServer();
