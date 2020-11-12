import React from 'react';
import styled from 'styled-components';

import Input from '@atoms/Input';
import Button from '@atoms/Button';

const WhoreWrapper = styled.div`
  display: flex;
  gap: 2em;
  width: 100%;
`;

const IssueListTitle = (props) => {
  return (
    <WhoreWrapper>
      <Input />
      <Button> Label / Milestone</Button>
      <Button type="create">New Issue</Button>
    </WhoreWrapper>
  );
};

export default IssueListTitle;
