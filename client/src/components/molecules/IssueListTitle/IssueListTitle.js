import React from 'react';
import styled from 'styled-components';
import { useHistory } from 'react-router-dom';

import Input from '@atoms/Input';
import Button from '@atoms/Button';

const WhoreWrapper = styled.div`
  display: flex;
  gap: 2em;
  width: 100%;
`;

const IssueListTitle = (props) => {
  const history = useHistory();

  const redirectLabel = () => {
    history.push('/label');
  };

  const redirectNewIssue = () => {
    history.push('/create-issue');
  };

  const logoutHandler = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    history.push('/login');
  };

  return (
    <WhoreWrapper>
      <Input />
      <Button onClick={logoutHandler} type="cancel">
        Logout
      </Button>
      <Button onClick={redirectLabel}> Label / Milestone</Button>
      <Button type="create" onClick={redirectNewIssue}>
        New Issue
      </Button>
    </WhoreWrapper>
  );
};

export default IssueListTitle;
