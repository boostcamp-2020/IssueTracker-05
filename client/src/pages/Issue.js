import React from 'react';
import styled from 'styled-components';

import MainHeader from '@molecules/MainHeader';
import IssueListTitle from '@molecules/IssueListTitle';
import IssueList from '@organisms/IssueList';

const WhoreWrapper = styled.div`
  display: flex;
  flex-direction: column;
  gap: 20px;
`;

const Issue = (props) => {
  return (
    <WhoreWrapper>
      <MainHeader />
      <IssueListTitle />
      <IssueList />
    </WhoreWrapper>
  );
};

export default Issue;
