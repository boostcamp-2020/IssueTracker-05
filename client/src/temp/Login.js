import React from "react";
import styled, { css } from "styled-components";

const StyledButton = styled.button`
  font-size: 20px;
  padding: 5px 15px;
  background: #24922e;
  border: none;
  color: #fff;
  border-radius: 10px;
`;

const LoginWrapper = styled.div`
  position: absolute;
  top: 50%;
  left: 50%;
  width: 500px;
  height: 500px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin: -250px 0 0 -250px;
  border-radius: 15px;
  background: #efefef;
`;

const InputWrapper = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: start;
  margin-bottom: 30px;
`;

const Label = styled.label`
  margin-bottom: 10px;
`;

const Input = styled.input`
  width: 400px;
  border: #ccc;
  height: 40px;
  border-radius: 10px;
`;

const GithubLogin = styled.button`
  width: 400px;
  background-color: #444;
  color: white;
  padding: 10px;
  border-radius: 10px;
`;

const ButtonWrapper = styled.div`
  display: flex;
  justify-content: space-around;
  align-items: center;
  width: 400px;
  margin-bottom: 30px;
`;

const Login = () => {
  return (
    <LoginWrapper>
      <InputWrapper>
        <Label for="id">아이디</Label>
        <Input name="id" placeholder="아이디" />
      </InputWrapper>
      <InputWrapper>
        <Label for="pw">비밀번호</Label>
        <Input name="pw" placeholder="비밀번호" />
      </InputWrapper>
      <ButtonWrapper>
        <StyledButton>로그인</StyledButton>
        <StyledButton>회원 가입</StyledButton>
      </ButtonWrapper>
      <InputWrapper>
        <GithubLogin>Sign in with Github</GithubLogin>
      </InputWrapper>
    </LoginWrapper>
  );
};

export default Login;
