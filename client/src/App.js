import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';
import { CookiesProvider } from 'react-cookie';

import { ThemeProvider } from 'styled-components';

import theme from './components/themes/default';

import Main from './route/Main';
// import Sign from './route/Sign';

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <Router>
        <CookiesProvider>
          <Main />
        </CookiesProvider>
      </Router>
    </ThemeProvider>
  );
};

export default App;
