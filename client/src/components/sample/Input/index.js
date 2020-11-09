import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const setWidth = ({ InputWidth }) => `${InputWidth}px`;
const setHeight = ({ InputHeight }) => `${InputHeight}px`;
const backgroundColor = ({ InputBackground }) => palette(InputBackground);

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
  InputBackground: PropTypes.number,
  InputWidth: PropTypes.number,
  InputHeight: PropTypes.number,
};

Input.defaultProps = {
  palette: "primary",
};

export default Input;
