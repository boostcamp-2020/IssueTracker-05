import React from 'react';
import styled from 'styled-components';
import Proptypes from 'prop-types';
import Button from '@atoms/Button';
import Label from '@atoms/Label';
import Span from '@atoms/Span';

const WhoreWrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
  padding: 1em;
  align-items: center;
  border: 1px solid #ccc;
  width: 100%;
`;

const LabelWrapper = styled.div`
  box-sizing: border-box;
  width: 20%;
`;

const ButtonWrapper = styled.div`
  box-sizing: border-box;
  width: 30%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
`;

const ExplainWrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  justify-content: start;
  align-items: center;
  width: 75%;
`;

const LabelInform = (props) => {
  const edit = { ...props, type: 'edit' };
  const cancel = { ...props, type: 'cancel' };
  return (
    <WhoreWrapper>
      <LabelWrapper>
        <Label {...props}>{props.name}</Label>
      </LabelWrapper>
      <ExplainWrapper>
        <Span {...props}>{props.explain}</Span>
      </ExplainWrapper>
      <ButtonWrapper>
        <Button {...edit}>edit</Button>
        <Button {...cancel}>delete</Button>
      </ButtonWrapper>
    </WhoreWrapper>
  );
};

LabelInform.propTypes = {
  name: Proptypes.string,
  explain: Proptypes.string,
  fontSize: Proptypes.string,
  background: Proptypes.string,
  type: Proptypes.string,
};

LabelInform.defaultProps = {
  name: 'gogogogogogogogogo',
  explain: 'explain sth',
  fontSize: '1em',
};

export default LabelInform;
