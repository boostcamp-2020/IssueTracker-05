import React, { useReducer, useState } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import treatState from '@hooks/treatState.js';
import Label from '@atoms/Label';
import Button from '@atoms/Button';
import InputBox from '@molecules/InputBox';

const WhoreWrapper = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  padding: 1em;
  border: 1px solid black;
`;

const LabelPreviewWrapper = styled.div`
  width: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  margin-bottom: 2em;
`;

const DescWrapper = styled.div`
  width: 100%;
  display: inline-flex;
  gap: 12px;
  gap: 12px;
`;

const ButtonWrapper = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
`;

const LabelInformCreate = (props) => {
  const [
    { labelName, labelDesc, labelColor },
    getLabels,
    onLabelInformCreate,
    resetLabelInformCreate,
  ] = treatState();
  return (
    <WhoreWrapper>
      <LabelPreviewWrapper>
        <Label background="#34A3D5">Label Preview</Label>
      </LabelPreviewWrapper>
      <DescWrapper>
        <InputBox
          value={labelName}
          onChange={onLabelInformCreate}
          reset={resetLabelInformCreate}
          name="labelName"
        >
          Label name
        </InputBox>
        <InputBox
          value={labelDesc}
          onChange={onLabelInformCreate}
          reset={resetLabelInformCreate}
          name="labelDesc"
          type="textarea"
        >
          Description
        </InputBox>
        <InputBox
          value={labelColor}
          onChange={onLabelInformCreate}
          reset={resetLabelInformCreate}
          name="labelColor"
        >
          Color
        </InputBox>
        <ButtonWrapper>
          <Button type="cancel">Cancel</Button>
          <Button type="create">Create Label</Button>
        </ButtonWrapper>
      </DescWrapper>
    </WhoreWrapper>
  );
};

export default LabelInformCreate;
