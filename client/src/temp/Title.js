import React from "react";
import styled from "styled-components";

const Title = styled.div`
  position: fixed;
  top: 0;
  left: 0;
  margin: 0 0;
  border: 0px solid white;
  text-align: center;
  width: 100%;
  height: 80px;
  line-height: 80px;
  background: black;
  color: white;
  font-size: 25px;
`;

export default () => {
  return <Title>ISSUE</Title>;
};
