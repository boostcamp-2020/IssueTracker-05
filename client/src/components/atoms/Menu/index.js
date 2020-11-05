import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const backgroundColor = ({ MenuBackground }) => palette(MenuBackground);
const fontSize = ({ MenuFontSize }) => `${MenuFontSize}px`;
const setHeight = ({ MenuHeight }) => `${MenuHeight}px`;
const setWidth = ({ MenuWidth }) => `${MenuWidth}px`;

const StyledMenu = styled.div`
  box-sizing: border-box;
  font-size: ${fontSize};
  font-family: ${font("primary")};
  background: ${backgroundColor};
  height: ${setHeight};
  width: ${setWidth};
  padding: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
`;

const Menu = (props) => {
  return <StyledMenu {...props} />;
};

Menu.PropTypes = {
  MenuBackground: PropTypes.number,
  MenuSize: PropTypes.number,
  MenuHeight: PropTypes.number,
  MenuWidth: PropTypes.number,
};

Menu.defaultProps = {
  palette: "primary",
};

export default Menu;
