import React from 'react';
import styled from 'styled-components';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from 'react-router-dom';

import SignBox from '@organisms/SignBox';
import SignupBox from '@organisms/Signup';

import authStorage from '@constants/auth/auth';

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
  const [state, changeHandler] = authStorage();
  return (
    <WholeWrapper>
      <SignBox state={state} changeHandler={changeHandler} />
    </WholeWrapper>
  );
};
