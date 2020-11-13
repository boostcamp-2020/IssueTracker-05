import React from 'react';
import { BrowserRouter as Router } from 'react-router-dom';

import { ThemeProvider } from 'styled-components';

import theme from './components/themes/default';

import Main from './route/Main';
// import Sign from './route/Sign';

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <Router>
        <Main />
      </Router>
    </ThemeProvider>
  );
};

export default App;
