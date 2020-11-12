import React from 'react';
import styled from 'styled-components';

import Dropdown from '@atoms/Dropdown';

const Wrapper = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  z-index: -1;
`;

const IssueDropBox = (props) => {
  return (
    <>
      <Wrapper>
        {props.IssueDropBoxContent.map((v) => (
          <Dropdown {...v} key={v.name} />
        ))}
      </Wrapper>
    </>
  );
};

IssueDropBox.defaultProps = {
  IssueDropBoxContent: [
    {
      name: 'Assignees',
      title: 'Filter List',
      contentList: ['Content1', 'Content2', 'Content3', 'Content4', 'Content5'],
    },
    {
      name: 'Labels',
      title: 'Filter List',
      contentList: ['Content1', 'Content2', 'Content3', 'Content4', 'Content5'],
    },
    {
      name: 'Milestones',
      title: 'Filter List',
      contentList: ['Content1', 'Content2', 'Content3', 'Content4', 'Content5'],
    },
  ],
};
export default IssueDropBox;
