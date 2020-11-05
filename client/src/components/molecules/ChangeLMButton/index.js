import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";

import Button from "../../atoms/Button";

const Wrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  justify-content: cente;
  align-items: center;
  width: 300px;
  border: 2px solid black;
`;

const ChangeLMButton = (props) => {
  const
  return (
    <Wrapper>
      <Button {...ButtonInform}>{LabelButtonName}</Button>
      <Button {...ButtonInform}>{MilestoneButtonName}</Button>
    </Wrapper>
  );
};

ChangeLMButton.PropTypes = {
  MilestoneButtonName: PropTypes.string,
  LabelButtonName: PropTypes.string,
  disabled: PropTypes.bool,
  height: PropTypes.number,
  width: PropTypes.number,
};

ChangeLMButton.defaultProps = {
  palette: "primary",
};

export default ChangeLMButton;
