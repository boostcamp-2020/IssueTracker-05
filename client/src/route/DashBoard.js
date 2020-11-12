import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Label from '@pages/Label';
import Milestone from '@pages/Milestone';

export default () => {
  return (
    <Switch>
      <Route path="/main/new-milestone">
        <Milestone />
      </Route>
      <Route path="/main/label">
        <Label />
      </Route>
      <Route path="/">
        <Label />
      </Route>
    </Switch>
  );
};
