import React from 'react';
import styled from 'styled-components';
import Button from '@atoms/Button';
import InputBox from '@molecules/InputBox';
import { useHistory } from 'react-router-dom';

const WholeStyle = styled.div`
  box-sizing: border-box;
  padding: 0 1em;
`;

const InputStyle = styled.div`
  display: flex;
  flex-direction: column;
  padding-left: 20px;
  gap: 20px;
  width: 60%;
`;

const ButtonBox = styled.div`
  display: flex;
  margin-top: 30px;
  padding-right: 20px;
  margin-right: 20px;
  justify-content: flex-end;
  gap: 10px;
`;

const CreateEditMilestone = (props) => {
  const { state, onChange, onSubmit } = props;
  const history = useHistory();

  const redirect = () => {
    history.push('/label');
  };
  return (
    <WholeStyle>
      <InputStyle>
        <InputBox
          children="제목"
          name="title"
          value={state.title}
          onChange={onChange}
          type="text"
        />
        <InputBox
          children="기한"
          name="dueDate"
          value={state.dueDate}
          onChange={onChange}
          type="date"
        />
        <InputBox
          children="설명"
          name="desc"
          value={state.desc}
          onChange={onChange}
          type="textarea"
        />
      </InputStyle>
      <ButtonBox>
        <Button type="cancel" onClick={redirect}>
          Cancel
        </Button>
        <Button
          type="create"
          onClick={() => {
            onSubmit(state.title, state.dueDate, state.desc);
            redirect();
          }}
        >
          Create
        </Button>
      </ButtonBox>
    </WholeStyle>
  );
};

export default CreateEditMilestone;
