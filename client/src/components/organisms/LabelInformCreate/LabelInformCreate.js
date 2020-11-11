import React, { useState } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Label from '@atoms/Label';
import Button from '@atoms/Button';
import InputBox from '@molecules/InputBox';

const WholeWrapper = styled.div`
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
  const { state, changeHandler, cancelLabel, submitHandler } = props;
  let isDisabled;
  if (state.name === '' || state.color === '') {
    isDisabled = true;
  } else {
    isDisabled = false;
  }
  return (
    <WholeWrapper>
      <LabelPreviewWrapper>
        <Label color={state.color}>{state.name}</Label>
      </LabelPreviewWrapper>
      <DescWrapper>
        <InputBox value={state.name} onChange={changeHandler} name="name">
          Label name
        </InputBox>
        <InputBox
          value={state.desc}
          onChange={changeHandler}
          name="desc"
          type="textarea"
        >
          Description
        </InputBox>
        <InputBox value={state.color} onChange={changeHandler} name="color">
          Color
        </InputBox>
        <ButtonWrapper>
          <Button type="cancel" onClick={cancelLabel}>
            Cancel
          </Button>
          <Button type="create" disabled={isDisabled} onClick={submitHandler}>
            {state.prevName === '' ? 'Create Label' : 'Edit Label'}
          </Button>
        </ButtonWrapper>
      </DescWrapper>
    </WholeWrapper>
  );
};

export default LabelInformCreate;
