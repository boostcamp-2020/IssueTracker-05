import React from 'react';
import { Switch, Route } from 'react-router-dom';

import cookie from 'react-cookies';
import SignPage from '@pages/Sign';

const Sign = () => {
  return (
    <Switch>
      <Route path="/">
        <SignPage />
      </Route>
    </Switch>
  );
};

export default Sign;
