import React from "react";
import PropTypes from "prop-types";
import styled from "styled-components";
import { palette } from "styled-theme";

import Button from "../../atoms/Button/index";
import Label from "../../atoms/Label/index";
import Explain from "../../atoms/Explain/index";

const setWidth = ({ LabelFieldWidth }) => `${LabelFieldWidth}px`;
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
  const { LabelName, ExplainDesc, ButtonUpdate, ButtonDelete } = props;
  return (
    <Wrapper {...props}>
      <Label {...props}>{LabelName}</Label>
      <Explain {...props}>{ExplainDesc}</Explain>
      <Button {...props}>{ButtonUpdate}</Button>
      <Button {...props}>{ButtonDelete}</Button>
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
  LabelFieldWidth: PropTypes.number,
};

LabelField.defaultProps = {
  palette: "primary",
};

export default LabelField;
