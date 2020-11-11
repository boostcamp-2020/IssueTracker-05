import React from 'react';

import { ThemeProvider } from 'styled-components';
import theme from './components/themes/default';

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <div> hi </div>
    </ThemeProvider>
  );
};

export default App;
