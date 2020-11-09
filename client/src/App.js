import React from 'react';

import { ThemeProvider } from 'styled-components';
import Login from './temp/Login';
import Title from './temp/Title';

import theme from './components/themes/default';

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <Title />
      <Login />
    </ThemeProvider>
  );
};

export default App;
