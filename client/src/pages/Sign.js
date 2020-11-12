import React, { useState } from 'react';
import styled from 'styled-components';

import SignBox from '@organisms/SignBox';
import Signup from '@organisms/Signup';

import loginStorage from '@constants/auth/login';

const WholeWrapper = styled.div`
  display: flex;
  width: 99%;
  flex-direction: column;
  padding: 20vh 0;
  box-sizing: content-box;
  background-color: #e8e8e8;
  align-items: center;
`;

export default () => {
  const [state, changeHandler] = loginStorage();
  const [page, setPage] = useState(0);

  return (
    <WholeWrapper>
      {page === 0 ? (
        <SignBox state={state} changeHandler={changeHandler} page={setPage} />
      ) : (
        <Signup page={setPage} />
      )}
    </WholeWrapper>
  );
};
