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
  const users = props.state.users
    ? props.state.users.map((v) => {
        return { name: v.nickname };
      })
    : '';

  const labels = props.state.labels
    ? props.state.labels.map((v) => {
        return { name: v.name };
      })
    : '';

  const milestones = props.state.milestones
    ? props.state.milestones.map((v) => {
        return { name: v.title };
      })
    : '';

  const IssueDropBoxContent = [
    {
      name: 'Assignees',
      title: 'Filter List',
      contentList: users,
    },
    {
      name: 'Labels',
      title: 'Filter List',
      contentList: labels,
    },
    {
      name: 'Milestones',
      title: 'Filter List',
      contentList: milestones,
    },
  ];

  return (
    <>
      <Wrapper>
        {IssueDropBoxContent.map((v) => (
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
