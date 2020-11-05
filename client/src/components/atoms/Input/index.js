import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const setWidth = ({width}) => `${width}px`;
const setHeight = ({height}) => `${height}px`;
const backgroundColor = ({background}) => palette(background);

const StyledInput = styled.input`
  box-sizing: border-box;
  background: ;
  width: ${setWidth};
  height: ${setHeight};
  background: ${backgroundColor};
  border-radius: 5px;
`;

const Input = (props) => {
  return <StyledInput {...props} />;
};

Input.PropTypes = {
  background: PropTypes.number,
  width: PropTypes.number,
  height: PropTypes.number,
};

Input.defaultProps = {
  palette: "primary",
};

export default Input;
