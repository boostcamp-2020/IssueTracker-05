import React from "react";

import Login from "./temp/Login";
import Title from "./temp/Title";

import { ThemeProvider } from "styled-components";
import theme from "./components/themes/default";

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <Title />
      <Login />
    </ThemeProvider>
  );
};

export default App;
