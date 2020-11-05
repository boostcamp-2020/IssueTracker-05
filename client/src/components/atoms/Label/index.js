import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { font, palette } from "styled-theme";

const backgroundColor = ({ LabelBackground }) => `${LabelBackground}`;
const setWidth = ({ LabelWidth }) => `${LabelWidth}px`;

const StyledLabel = styled.div`
  box-sizing: border-box;
  background: ${backgroundColor};
  height: 40px;
  width: ${setWidth};
  font-size: 16px;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff;
  outline: none;
  border: none;
  border-radius: 5px;
  padding: 5px;
  font-family: ${font("primary")};
`;

const Label = (props) => {
  return <StyledLabel {...props} />;
};

Label.PropTypes = {
  LabelBackground: PropTypes.string,
  LabelWidth: PropTypes.number,
};

Label.defaultProps = {
  palette: "primary",
};

export default Label;
