import React, { useEffect } from 'react';
import styled from 'styled-components';

import IssueListContent from '@molecules/IssueListContent';
import IssueListMenu from '@molecules/IssueListMenu';

import IssueStore from '@constants/issue/issueList';

const WhoreWrapper = styled.div`
  display: flex;
  flex-direction: column;
`;

const IssueList = (props) => {
  const [state, getIssues] = IssueStore();

  useEffect(() => {
    getIssues();
  }, []);

  return (
    <WhoreWrapper>
      <IssueListMenu />
      {state.map((v) => (
        <IssueListContent issue={v} key={v.iid} />
      ))}
    </WhoreWrapper>
  );
};

export default IssueList;
