import React from 'react';
import styled from 'styled-components';
import * as axios from '@system/axios/auth';

import InputBox from '@molecules/InputBox';
import OauthButton from '@atoms/OauthButton';

const WholeWrapper = styled.div`
  display: flex;
  flex-direction: column;
  width: 50%;
  heigh: 50%;
  box-sizing: content-box;
  border: 1.5px solid lightgray;
  padding: 3em;
  align-items: center;
  background-color: white;
`;

const InputWrapper = styled.div`
  flex: 1;
  width: 100%;
  margin: 0 auto;
`;

const SignWrapper = styled.div`
  flex: 1;
  display: flex;
  justify-content: space-between;
  a {
    text-decoration: none;
    color: #13b5f8;
  }
  width: 60%;
`;

const Signbox = (props) => {
  const { state, changeHandler } = props;

  const localLogin = async (e) => {
    e.preventDefault();
    await axios.localLogin(state);
  };

  return (
    <WholeWrapper>
      <InputWrapper>
        <InputBox name="userId" value={state.userId} onChange={changeHandler}>
          아이디
        </InputBox>
        <br />
        <InputBox
          name="password"
          value={state.password}
          type="password"
          onChange={changeHandler}>
          비밀번호
        </InputBox>
        <br />
      </InputWrapper>
      <SignWrapper>
        <a href="" onClick={localLogin}> 로그인 </a>
        <a href=""> 회원가입 </a>
      </SignWrapper>
      <br /><br />
      <a href="localhost:5000/api/login/github">
        <OauthButton />
      </a>
    </WholeWrapper>
  );
};

export default Signbox;
