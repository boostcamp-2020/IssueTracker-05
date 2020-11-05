import React from "react";
import styled from "styled-components";

import ChangeLMButton from "../../molecules/ChangeLMButton";
import Button from "../../atoms/Button";
import LabelContents from "../../organisms/LabelContents";
import MainHeader from "../../atoms/MainHeader";

const setWidth = ({ width }) => `${width}px`;

const WhoreWrapper = styled.div`
  width: ${setWidth};
  display: flex;
  justify-content: center;
`;

const TopWrapper = styled.div`
  width: ${setWidth};
  display: flex;
  justyify-content: space-between;
  align-items: center;
  margin: 0 auto;
`;

const LabelPage = (props) => {
  const {
    MainHeaderTitle,
    MainHeaderBackground,
    MilestoneButtonName,
    LabelButtonName,
    MLWidth,
    MLHeight,
    disabled,
    palette,
    NewLabelButtonFontSize,
    NewLabelButtonWidth,
    NewLabelButtonHeight,
  } = props;
  const MainHeaderInform = {
    title: MainHeaderTitle,
    background: MainHeaderBackground,
    palette,
  };
  const ChangeMLButtonInform = {
    MilestoneButtonName,
    LabelButtonName,
    disabled,
    width: MLWidth,
    height: MLHeight,
  };
  const NewLabelButtonInform = {
    fontSize: NewLabelButtonFontSize,
    width: NewLabelButtonWidth,
    height: NewLabelButtonHeight,
  };
  return (
    <>
      <MainHeader {...MainHeaderInform} />
      <TopWrapper>
        <ChangeLMButton {...ChangeMLButtonInform}></ChangeLMButton>
        <Button {...NewLabelButtonInform}>New Label</Button>
      </TopWrapper>
      <WhoreWrapper></WhoreWrapper>
    </>
  );
};
