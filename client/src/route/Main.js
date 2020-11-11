import React from 'react';
import { Switch, Route, Link, browserHistory } from 'react-router-dom';

import Login from '@pages/Sign';
import DashBoard from './DashBoard';
import PrivateRoute from './PrivateRoute';

const Main = () => {
  return (
    <Switch>
      <Route path="/">
        <DashBoard />
      </Route>
    </Switch>
  );
};

export default Main;
