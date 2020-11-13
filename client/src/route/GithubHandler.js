import React from 'react';
import { Redirect } from 'react-router-dom';
import Cookies from 'universal-cookie';

const GithubHandler = (props) => {
  const cookies = new Cookies();

  localStorage.setItem('token', cookies.get('token'));
  localStorage.setItem('user', cookies.get('user'));

  cookies.remove('token');
  cookies.remove('user');

  return <Redirect to={{ pathname: '/' }} />;
};

export default GithubHandler;
