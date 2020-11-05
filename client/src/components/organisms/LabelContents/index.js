import React, { useRef } from "react";
import styled from "styled-components";
import PropTypes from "prop-types";
import ContentHeader from "../../atoms/ContentHeader";
import LabelField from "../../molecules/LabelFiled";

const setWidth = ({ LabelContentsWidth }) => `${LabelContentsWidth}px`;

const Wrapper = styled.div`
  box-sizing: border-box;
  border: 1px solid black;
  width: ${setWidth};
`;

const LabelContents = (props) => {
  const labelCnt = useRef(0);
  const { LabelsInform } = props;
  return (
    <Wrapper {...props}>
      <ContentHeader {...props}>레이블 목록</ContentHeader>
      {LabelsInform.map((LabelInform) => (
        <LabelField
          {...{ ...LabelInform, ...props }}
          key={labelCnt.current++}
        />
      ))}
    </Wrapper>
  );
};

LabelContents.PropTypes = {
  LabelContentsWidth: PropTypes.number,
  LabelsInform: PropTypes.array,
};

export default LabelContents;
