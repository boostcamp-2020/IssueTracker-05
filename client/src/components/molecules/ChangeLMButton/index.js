import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";

import Button from "../../atoms/Button";

const Wrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  justify-content: cente;
  align-items: center;
`;

const ChangeLMButton = (props) => {
  return (
    <Wrapper>
      <Button {...props}>LabelButton</Button>
      <Button {...props}>MilestoneButton</Button>
    </Wrapper>
  );
};

ChangeLMButton.PropTypes = {
  ButtonDisabled: PropTypes.bool,
  ButtonHeight: PropTypes.number,
  ButtonWidth: PropTypes.number,
};

ChangeLMButton.defaultProps = {
  palette: "primary",
};

export default ChangeLMButton;
