import React from 'react';
import styled from 'styled-components';
import { ReactComponent as GithubLogo } from '../Icon/github-logo.svg';

const fontSize = ({ height }) => `${height / 35.5555555556}rem`;

const ButtonStyle = styled.button`
  display: inline-flex;
  box-sizing: border-box;
  font-size: ${fontSize};
  align-items: center;
  align-content: center;
  justify-content: center;
  padding: 0.3em 1.2em;
  width: 100%;
  height: 2.5rem;
  background: #9da1a6;
  color: white;
  border: 0;
  outline: none;
  :hover {
    background: #c8b6bd;
    cursor: pointer;
  }
`;

const SigninWithGithub = () => {
  return (
    <ButtonStyle>
      Sign in with Github
      <GithubLogo style={{ padding: 5 }} />
    </ButtonStyle>
  );
};

export default SigninWithGithub;
