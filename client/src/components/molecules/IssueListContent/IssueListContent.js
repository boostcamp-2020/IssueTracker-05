import React from 'react';
import { useHistory } from 'react-router-dom';
import styled from 'styled-components';

import Label from '@atoms/Label';

const WholeWrapper = styled.div`
  display: flex;
  gap: 2em;
  width: 100%;
  padding: 0.7em 0;
  justify-content: space-around;
  box-sizing: border-box;
  border: 1px solid #edf0f2;
  &:hover {
    background-color: #ecf0f1;
    cursor: pointer;
  }
`;

const ContentDiv = styled.div`
  width: 100%;
  text-align: left;
  padding: 0.5em 3em;
`;

const DetailDiv = styled.div`
  margin-top: 10px;
`;

const Wrapper = styled.div`
  flex: 1;
`;

const Title = styled.h2`
  margin: 10px 0px;
`;

const Assignee = styled.div`
  position: absoulte;
  top: 0px;
`;

const IssueListContent = (props) => {
  const history = useHistory();

  const redirect = () => {
    history.push(`/issue/${props.issue.iid}`);
  };

  return (
    <WholeWrapper onClick={redirect}>
      <ContentDiv>
        <Title>{props.issue.title}</Title>
        {props.issue.labels.map((v) => (
          <Label color={v.color}>{v.name}</Label>
        ))}
        <DetailDiv>
        #{props.issue.iid} opened at {props.issue.createdAt.substr(0, 10)} by {props.issue.user.nickname}
        <br />
        {props.issue.milestone ? 'Milestone: '+props.issue.milestone.title : ''}
        </DetailDiv>
        <Assignee>
          Assignees: {props.issue.assignees.length}명
        </Assignee>
      </ContentDiv>
    </WholeWrapper>
  );
};

export default IssueListContent;
