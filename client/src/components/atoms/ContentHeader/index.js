import React from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import { palette } from "styled-theme";

const setWidth = ({ ContentHeaderWidth }) => `${ContentHeaderWidth}px`;
const setHeight = ({ ContentHeaderHeight }) => `${ContentHeaderHeight}px`;
const fontSize = ({ ContentHeaderFontSize }) => `${ContentHeaderFontSize}px`;

const StyledHeader = styled.div`
  box-sizing: border-box;
  font-size: ${fontSize};
  width: ${setWidth};
  height: ${setHeight};
  background: ${palette(3)};
  border: 1px solid black;
`;

const ContentHeader = (props) => {
  return <StyledHeader {...props} />;
};

ContentHeader.PropTypes = {
  ContentHeaderWidth: PropTypes.number,
  ContentHeaderHeight: PropTypes.number,
  ContentFontSize: PropTypes.number,
};

ContentHeader.defaultProps = {
  palette: "primary",
};

export default ContentHeader;
