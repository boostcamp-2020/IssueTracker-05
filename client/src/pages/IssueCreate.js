import React, { useEffect } from 'react';
import styled from 'styled-components';

import MainHeader from '@molecules/MainHeader';
import IssueDropBox from '@organisms/IssueDropBox';
import IssueCreate from '@organisms/IssueCreate';

import IssueCreateStore from '@constants/issue/issueCreate';

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
  const [state, changeHandler, submit, getSidebar] = IssueCreateStore();
  useEffect(() => {
    getSidebar();
  }, []);

  return (
    <div>
      <MainHeader />
      <WhoreWrapper>
        <Wrapper1>
          <IssueCreate
            state={state}
            onChange={changeHandler}
            onSubmit={submit} />
        </Wrapper1>
        <Wrapper2>
          <IssueDropBox state={state} />
        </Wrapper2>
      </WhoreWrapper>
    </div>
  );
};

export default IssueInform;
