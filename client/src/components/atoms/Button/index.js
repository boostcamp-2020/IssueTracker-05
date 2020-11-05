import React from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import { palette } from "styled-theme";

const fontSize = ({ height }) => `${height / 40}rem`;
const backgroundColor = ({ disabled }) => (disabled ? palette(2) : palette(1));
const foregroundColor = ({ disabled }) =>
  disabled ? palette("grayscale", 0, true) : palette("grayscale", 3, true);
const hoverBackgroundColor = ({ disabled }) => !disabled && palette(0);
const hoverForegroundColor = ({ disabled }) => !disabled && palette(0);

const StyledButton = styled.button`
  font-size: ${fontSize};
  box-sizing: border-box;
  outline: none;
  border: none;
  background: ${backgroundColor};
  padding: ${({ height }) => height * 0.8}px;
  margin: ${({ height }) => height * 1}px;
  color: ${foregroundColor};
  border-radius: 4px;

  &:hover,
  &:focus,
  &:active {
    background-color: ${hoverBackgroundColor};
    color: ${hoverForegroundColor};
  }

  &:focus {
    outline: none;
  }
`;

const Button = (props) => {
  return <StyledButton {...props} />;
};

Button.PropTypes = {
  disabled: PropTypes.bool,
  height: PropTypes.number,
};

Button.defaultProps = {
  palette: "primary",
  type: "button",
};

export default Button;
