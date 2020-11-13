import React from 'react';
import styled from 'styled-components';
import { useHistory } from 'react-router-dom';

import Img from '@atoms/Img';
import InputBox from '@molecules/InputBox';
import Button from '@atoms/Button';

const WholeWrapper = styled.div`
  box-sizing: border-box;
  border: 1px solid #ccc;
  width: 100%;
  display: flex;
  padding: 2em;
`;

const Wrapper1 = styled.div`
  box-sizing: border-box;
  width: 15%;
  padding: 0.5em;
  display: flex;
  justify-content: flex-end;
`;

const Wrapper2 = styled.div`
  box-sizing: border-box;
  width: 85%;
  padding: 0.5em;
  display: flex;
  flex-direction: column;
  gap: 20px;
`;

const ButtonWrapper = styled.div`
  display: flex;
  width: 100%;
  box-sizing: border-box;
  justify-content: flex-end;
`;

const IssueCreate = (props) => {
  const { state, onChange, onSubmit } = props;
  const history = useHistory();

  const redirect = () => {
    history.push('/');
  };

  return (
    <WholeWrapper>
      <Wrapper1>
        <Img />
      </Wrapper1>
      <Wrapper2>
        <InputBox name="title" value={state.title} onChange={onChange}>
          Title
        </InputBox>
        <InputBox
          name="content"
          value={state.content}
          onChange={onChange}
          type="textarea"
        >
          Desc
        </InputBox>
        <ButtonWrapper>
          <Button
            type="create"
            onClick={() => {
              onSubmit(state.title, state.content, [], [], []);
              redirect();
            }}
          >
            New Issue
          </Button>
        </ButtonWrapper>
      </Wrapper2>
    </WholeWrapper>
  );
};

export default IssueCreate;
