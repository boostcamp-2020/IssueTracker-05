import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const StyledExplain = styled.div`
  box-sizing: border-box;
  font-size: 20px;
  font-family: ${font("primary")};
  height: 30px;
  width: 200px;
  padding: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
`;

const Explain = (props) => {
  return <StyledExplain {...props} />;
};

Explain.PropTypes = {};

Explain.defaultProps = {
  palette: "primary",
};

export default Explain;
