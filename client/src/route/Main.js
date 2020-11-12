import React from 'react';
import { Switch, Route, Link, browserHistory } from 'react-router-dom';

import DashBoard from './DashBoard';

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
