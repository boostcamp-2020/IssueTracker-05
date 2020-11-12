import React from 'react';
import { Route, Switch } from 'react-router-dom';

import Label from '@pages/Label';
import Issue from '@pages/Issue';
import Milestone from '@pages/Milestone';
import IssueInform from '@pages/IssueInform';
import IssueCreate from '@pages/IssueCreate';

export default () => {
  return (
    <Switch>
      <Route path="/label/new-milestone">
        <Milestone />
      </Route>
      <Route path="/label">
        <Label />
      </Route>
      <Route path="/create-issue" component={IssueCreate} />
      <Route path="/issue/:iid" component={IssueInform} />
      <Route path="/">
        <Issue />
      </Route>
    </Switch>
  );
};
