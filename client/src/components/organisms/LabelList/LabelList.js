import React, { useReducer } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import LabelListTitle from '@molecules/LabelListTitle';

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
  return (
    <WhoreWrapper>
      <LabelPreviewWrapper>
        <Label background="#34A3D5">Label Preview</Label>
      </LabelPreviewWrapper>
      <DescWrapper>
        <InputBox>Label name</InputBox>
        <InputBox type="textarea">Description</InputBox>
        <InputBox>Color</InputBox>
        <ButtonWrapper>
          <Button type="cancel">Cancel</Button>
          <Button type="create">Create Label</Button>
        </ButtonWrapper>
      </DescWrapper>
    </WhoreWrapper>
  );
};

export default LabelInformCreate;
