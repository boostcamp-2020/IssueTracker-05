import React from 'react';
import { useCookies } from 'react-cookie';
import { Redirect } from 'react-router-dom';

const GithubHandler = (props) => {
  const [userCookies, setUserCookie, removeUserCookie] = useCookies(['user']);
  const [tokenCookies, setTokenCookie, removeTokenCookie] = useCookies(['token']);

  localStorage.setItem('token', tokenCookies);
  localStorage.setItem('user', userCookies);

  removeUserCookie('user');
  removeTokenCookie('token');

  return <Redirect to={{ pathname: '/' }} />;
};

export default GithubHandler;
