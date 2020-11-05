import React, { useState } from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import { palette } from "styled-theme";

const StyledHeader = styled.h1`
  box-sizing: border-box;
  width: 100%;
  height: 80px;
  background: ${palette(1)};
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
  MainHeaderTitle: "ISSUE",
};

export default MainHeader;
