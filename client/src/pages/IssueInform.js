import React, { useEffect } from 'react';
import styled from 'styled-components';

import MainHeader from '@molecules/MainHeader';
import IssueDropBox from '@organisms/IssueDropBox';
import IssueHeader from '@organisms/IssueHeader';
import IssueCommentCreate from '@organisms/IssueCommentCreate';
import IssueContent from '@organisms/IssueContent';

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
  const [state, getIssue] = IssuePageStore();

  useEffect(() => {
    getIssue(1) //나중에 props에서 빼와야 할 듯
  }, []);

  return (
    <div>
      <MainHeader />
      <IssueHeader issue={state.issue}/>
      <WhoreWrapper>
        <Wrapper1>
          <IssueContent issue={state.issue} />
          <IssueCommentCreate />
        </Wrapper1>
        <Wrapper2>
          <IssueDropBox />
        </Wrapper2>
      </WhoreWrapper>
    </div>
  );
};

export default IssueInform;
