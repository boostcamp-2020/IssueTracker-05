import React from 'react';
import { Switch, Route } from 'react-router-dom';

import DashBoard from './DashBoard';
import PrivateRoute from './PrivateRoute';
import Sign from './Sign';
import GithubHandler from './GithubHandler';

const Main = () => {
  return (
    <Switch>
      <Route path="/login/github" component={GithubHandler} />
      <Route path="/login">
        <Sign />
      </Route>
      <PrivateRoute path="/">
        <DashBoard />
      </PrivateRoute>
    </Switch>
  );
};

export default Main;
