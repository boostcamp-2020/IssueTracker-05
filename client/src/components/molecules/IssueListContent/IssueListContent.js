import React, { useState, useEffect } from 'react';
import styled from 'styled-components';

import Label from '@atoms/Label';

const WhoreWrapper = styled.div`
  display: flex;
  gap: 2em;
  width: 100%;
  padding: 0.7em 1em;
  justify-content: space-around;
  box-sizing: border-box;
  border: 1px solid black;
`;

const ContentDiv = styled.div`
  width: 100%;
  text-align: left;
  padding: 0.5em 3em;
`;

const DetailDiv = styled.div`
  display: flex;
  justify-content: space-around;
  width: 100%;
  gap: 10px;
`;

const Div = styled.div`
  box-sizing: border-box;
  border: 1px solid black;
  width: 100%;
`;

const IssueListContent = (props) => {
  return (
    <WhoreWrapper>
      <ContentDiv>
        <h2>{props.issue.title}</h2>
        <div>{props.issue.content}</div>
      </ContentDiv>
      <DetailDiv>
        <Div>{props.issue.user.nickname}</Div>
        <Div>
          {props.issue.labels.map((v) => (
            <Label color={v.color}>{v.name}</Label>
          ))}
        </Div>
        <Div>{props.issue.milestone ? props.issue.milestone.title : ''}</Div>
        <Div>{props.issue.assignees.length}</Div>
      </DetailDiv>
    </WhoreWrapper>
  );
};

export default IssueListContent;
