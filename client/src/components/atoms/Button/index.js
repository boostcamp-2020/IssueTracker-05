import React from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import { key, font, palette } from "styled-theme";

const fontSize = ({ ButtonFontSize }) => `${ButtonFontSize}px`;
const backgroundColor = ({ ButtonDisabled }) =>
  ButtonDisabled ? palette(2) : palette(1);
const foregroundColor = ({ ButtonDisabled }) =>
  ButtonDisabled
    ? palette("grayscale", 0, true)
    : palette("grayscale", 3, true);
const hoverBackgroundColor = ({ ButtonDisabled }) =>
  !ButtonDisabled && palette(0);
const hoverForegroundColor = ({ ButtonDisabled }) =>
  !ButtonDisabled && palette(0);
const setHeight = ({ ButtonHeight }) => `${ButtonHeight}px`;
const setWidth = ({ ButtonWidth }) => `${ButtonWidth}px`;

const StyledButton = styled.button`
  font-size: ${fontSize};
  box-sizing: border-box;
  outline: none;
  border: none;
  font-family: ${font("secondary")};
  background: ${backgroundColor};
  color: ${foregroundColor};
  border-radius: 4px;
  width: ${setWidth};
  height: ${setHeight};
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
  ButtonFontSize: PropTypes.number,
  ButtonDisabled: PropTypes.bool,
  ButtonWidth: PropTypes.number,
  ButtonHeight: PropTypes.number,
  ButtonFont: PropTypes.string,
};

Button.defaultProps = {
  palette: "primary",
  type: "button",
};

export default Button;
