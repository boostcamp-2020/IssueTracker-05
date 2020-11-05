import React from "react";
import styled from "styled-components";

import ChangeLMButton from "../../molecules/ChangeLMButton";
import Button from "../../atoms/Button";
import LabelContents from "../../organisms/LabelContents";
import MainHeader from "../../atoms/MainHeader";

const setWidth = ({ width }) => `${width}px`;

const WhoreWrapper = styled.div`
  display: flex;
  justify-content: center;
`;

const TopWrapper = styled.div`
  width: ${setWidth};
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0 auto;
  border: 1px solid black;
`;

const LabelPage = (props) => {
  const { LMInform } = props;
  const { LabelsInform } = props;
  return (
    <>
      <MainHeader {...props} />
      <TopWrapper {...props}>
        <ChangeLMButton {...LMInform} />
        <Button {...props}>New Label</Button>
      </TopWrapper>
      <WhoreWrapper>
        <LabelContents {...LabelsInform} />
      </WhoreWrapper>
    </>
  );
};

LabelPage.Propt = {};

export default LabelPage;
