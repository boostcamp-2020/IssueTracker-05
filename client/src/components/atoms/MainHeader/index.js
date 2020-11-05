import React, { useState } from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import { palette } from "styled-theme";

const backgroundColor = ({ MainHeaderBackground }) =>
  palette(MainHeaderBackground);

const StyledHeader = styled.h1`
  box-sizing: border-box;
  width: 100%;
  height: 80px;
  background: ${backgroundColor};
  color: #fff;
  font-size: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
`;

const MainHeader = (props) => {
  const [MainHeaderTitle, setMainHeaderTitle] = useState(props.MainHeaderTitle);
  return <StyledHeader {...props}>{MainHeaderTitle}</StyledHeader>;
};

MainHeader.PropTypes = {
  MainHeaderBackground: PropTypes.number,
  MainHeaderTitle: PropTypes.string,
};

MainHeader.defaultProps = {
  palette: "primary",
};

export default MainHeader;
