import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const backgroundColor = ({background}) => `${background}`;
const StyledLabel = styled.div`
  box-sizing: border-box;
  background: ${backgroundColor};
  height: 40px;
  width: 60px;
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  outline: none;
  border: none;
  border-radius: 5px;
  padding: 5px;
  font-family: ${font('primary')};
`;

const Label = (props) => {
  return <StyledLabel {...props} />;
};

Label.PropTypes = {
  background: PropTypes.string,
};

Label.defaultProps = {
  palette: "primary",
};

export default Label;
