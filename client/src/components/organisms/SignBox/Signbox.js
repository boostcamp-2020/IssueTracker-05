import React, { useState } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

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
  const [id, setId] = useState();
  const [pw, setPw] = useState();

  const changeInputId = (e) => {
    setId(e.target.value);
  };

  const changeInputPw = (e) => {
    setPw(e.target.value);
  };

  const login = (e) => {
    e.preventDefault();
  }

  const signUp = (e) => {
    e.preventDefault();
  }

  return (
    <WholeWrapper>
      <InputWrapper>
        <InputBox name="아이디" onChange={changeInputId}>
          아이디
        </InputBox>
        <br />
        <InputBox name="비밀번호" type="password" onChange={changeInputPw}>
          비밀번호
        </InputBox>
        <br />
      </InputWrapper>
      <SignWrapper>
        <a href="" onClick={login}>
          로그인
        </a>
        <a href="" onClick={signUp}>
          회원가입
        </a>
      </SignWrapper>
      <br /><br />
      <OauthButton />
    </WholeWrapper>
  );
};

export default Signbox;
