import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";

// import { Button, Label, Explain } from "../../atoms";

import Button from "../../atoms/Button/index";
import Label from "../../atoms/Label/index";
import Explain from "../../atoms/Explain/index";

const setWidth = ({ width }) => `${width}px`;
const Wrapper = styled.div`
  box-sizing: border-box;
  width: ${setWidth};
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  border: 2px dashed black;
`;

const LabelField = (props) => {
  const {
    LabelBackground,
    LabelWidth,
    ExplainBackgound,
    ButtonDisabled,
    ButtonHeight,
    ButtonWidth,
    ButtonFontSize,
    LabelName,
    ExplainDesc,
    ButtonUpdate,
    ButtonDelete,
    LabelFieldwidth,
  } = props;

  const LabelFieldInform = { width: LabelFieldwidth };
  const LabelInform = { background: LabelBackground, width: LabelWidth };
  const ButtonInform = {
    disabled: ButtonDisabled,
    height: ButtonHeight,
    width: ButtonWidth,
    fontSize: ButtonFontSize,
  };
  const ExplainInform = { background: ExplainBackgound };

  return (
    <Wrapper {...LabelFieldInform}>
      <Label {...LabelInform}>{LabelName}</Label>
      <Explain {...ExplainInform}>{ExplainDesc}</Explain>
      <Button {...ButtonInform}>{ButtonUpdate}</Button>
      <Button {...ButtonInform}>{ButtonDelete}</Button>
    </Wrapper>
  );
};

LabelField.PropTypes = {
  LabelBackground: PropTypes.string,
  LabelWidth: PropTypes.number,
  ExplainBackgound: PropTypes.number,
  ButtonDisabled: PropTypes.bool,
  ButtonHeight: PropTypes.number,
  ButtonWidth: PropTypes.number,
  ButtonFontSize: PropTypes.number,
  LabelName: PropTypes.string,
  ExplainDesc: PropTypes.string,
  ButtonUpdate: PropTypes.string,
  ButtonDelete: PropTypes.string,
  LabelFieldwidth: PropTypes.number,
};

LabelField.defaultProps = {
  type: "primary",
};

export default LabelField;
