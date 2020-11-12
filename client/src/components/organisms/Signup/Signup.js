import React, { useState } from 'react';
import styled from 'styled-components';

import InputBox from '@molecules/InputBox';

import signupStorage from '@constants/auth/signup';
import * as axios from '@system/axios/auth';

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

const SignupBox = (props) => {
  const [state, changeHandler] = signupStorage();

  const cancel = (e) => {
    e.preventDefault();
    props.page(0);
  };

  const signUp = async (e) => {
    e.preventDefault();
    const res = await axios.signup(state);
    if (res) {
      props.page(0);
    }
  };

  return (
    <WholeWrapper>
      <InputWrapper>
        <InputBox name="nickname" onChange={changeHandler}>
          닉네임
        </InputBox>
        - 영문과 숫자로 구성하여 6자 이상 16자 이하로 작성해주세요.
        <br /><br />
        <InputBox name="userId" onChange={changeHandler}>
          아이디
        </InputBox>
        - 영문과 숫자로 구성하여 6자 이상 16자 이하로 작성해주세요.
        <br /><br />
        <InputBox name="password" type="password" onChange={changeHandler}>
          비밀번호
        </InputBox>
        - 영문과 숫자, 특수문자로 구성하여 6자 이상 12자 이하로 작성해주세요. <br />
        - 허용되는 특수문자는 {"~!@#$%^&*()_+|<>?:{}"} 입니다.
        <br /><br />
      </InputWrapper>
      <SignWrapper>
        <a href="#" onClick={cancel}>
          취소
        </a>
        <a href="#" onClick={signUp}>
          회원가입
        </a>
      </SignWrapper>
      <br />
      <br />
    </WholeWrapper>
  );
};

export default SignupBox;
