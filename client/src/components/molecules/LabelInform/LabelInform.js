import React from 'react';
import styled from 'styled-components';
import Proptypes from 'prop-types';
import Button from '@atoms/Button';
import Label from '@atoms/Label';
import Span from '@atoms/Span';

const WholeWrapper = styled.div`
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
    <WholeWrapper>
      <LabelWrapper>
        <Label {...props}>{props.name}</Label>
      </LabelWrapper>
      <ExplainWrapper>
        <Span {...props}>{props.desc}</Span>
      </ExplainWrapper>
      <ButtonWrapper>
        <Button
          {...edit}
          onClick={() =>
            props.onEdit({
              name: props.name,
              desc: props.desc,
              color: props.color,
            })
          }
        >
          edit
        </Button>
        <Button {...cancel} onClick={() => props.onDelete(props.name)}>
          delete
        </Button>
      </ButtonWrapper>
    </WholeWrapper>
  );
};

LabelInform.propTypes = {
  name: Proptypes.string,
  desc: Proptypes.string,
  fontSize: Proptypes.string,
  color: Proptypes.string,
  type: Proptypes.string,
};

LabelInform.defaultProps = {
  name: 'gogogogogogogogogo',
  desc: 'explain sth',
  fontSize: '1em',
  color: '#aaaaaa',
  type: 'default',
};

export default LabelInform;
