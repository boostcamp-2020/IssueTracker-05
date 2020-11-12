import React, { useEffect } from 'react';
import styled from 'styled-components';

import MainHeader from '@molecules/MainHeader';
import IssueDropBox from '@organisms/IssueDropBox';
import IssueCreate from '@organisms/IssueCreate';

import IssuePageStore from '@constants/issue/issuePage';

const WhoreWrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
`;

const Wrapper1 = styled.div`
  box-sizing: border-box;
  width: 80%;
`;

const Wrapper2 = styled.div`
  box-sizing: border-box;
  width: 20%;
  padding-left: 30px;
`;

const IssueInform = (props) => {
  const [state, getIssue, getAssignees, getLabels, getMilestones] = IssuePageStore();

  useEffect(() => {
    getAssignees();
    getLabels();
    getMilestones();
  }, []);

  return (
    <div>
      <MainHeader />
      <WhoreWrapper>
        <Wrapper1>
          <IssueCreate />
        </Wrapper1>
        <Wrapper2>
          <IssueDropBox state={state} />
        </Wrapper2>
      </WhoreWrapper>
    </div>
  );
};

export default IssueInform;
