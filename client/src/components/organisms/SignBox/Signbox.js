import React from 'react';
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
  return (
    <WholeWrapper>
      <InputWrapper>
        <InputBox name="로그인">로그인</InputBox>
        <br />
        <InputBox name="비밀번호">비밀번호</InputBox>
        <br />
      </InputWrapper>
      <SignWrapper>
        <a href="">로그인</a>
        <a href="">회원가입</a>
      </SignWrapper>
      <br /><br />
      <OauthButton />
    </WholeWrapper>
  );
};

export default Signbox;
