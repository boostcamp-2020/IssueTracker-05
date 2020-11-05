import React, { useRef } from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import ContentHeader from "../../atoms/ContentHeader";
import LabelField from "../../molecules/LabelFiled";

const setWidth = ({ width }) => `${width}px`;

const Wrapper = styled.div`
  box-sizing: border-box;  
  width: ${setWidth}
  border: 1px solid black;
`;

const LabelContents = (props) => {
  const labelCnt = useRef(0);
  const {
    width,
    height,
    fontSize,
    LabelWidth,
    ExplainBackgound,
    ButtonDisabled,
    ButtonHeight,
    ButtonWidth,
    ButtonFontSize,
    ButtonUpdate,
    ButtonDelete,
    LabelsInform,
  } = props;
  const ContentsInform = { width, height, fontSize };
  const LabelFieldInform = {
    LabelWidth,
    ExplainBackgound,
    ButtonDisabled,
    ButtonHeight,
    ButtonWidth,
    ButtonFontSize,
    ButtonUpdate,
    ButtonDelete,
    LabelFieldwidth: width,
  };
  return (
    <Wrapper {...ContentsInform}>
      <ContentHeader {...ContentsInform}>레이블 목록</ContentHeader>
      {LabelsInform.map((LabelInform) => (
        <LabelField
          {...{ ...LabelInform, ...LabelFieldInform }}
          key={labelCnt.current++}
        />
      ))}
    </Wrapper>
  );
};

LabelContents.PropTypes = {
  width: PropTypes.number,
  LabelsInform: PropTypes.array,
};

export default LabelContents;
