import React from 'react';
import { Redirect } from 'react-router-dom';
import Cookies from 'universal-cookie';

const GithubHandler = (props) => {
  const cookies = new Cookies();

  localStorage.setItem('token', cookies.get('token'));
  localStorage.setItem('user', cookies.get('user'));

  // removeUserCookie('user');
  // removeTokenCookie('token');

  return <Redirect to={{ pathname: '/' }} />;
};

export default GithubHandler;
