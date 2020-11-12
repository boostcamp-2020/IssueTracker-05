import React from 'react';
import styled from 'styled-components';

import IssueContentHeader from '@molecules/IssueContentHeader';
import Span from '@atoms/Span';
import Img from '@atoms/Img';

const WhoreWrapper = styled.div`
  box-sizing: border-box;
  border: 1px solid #ccc;
  width: 100%;
  display: flex;
  flex-direction: column;
`;

const ContentWrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  margin-bottom: 10px;
`;

const Wrapper1 = styled.div`
  box-sizing: border-box;
  width: 10%;
  padding: 0.5em;
  display: flex;
  justify-content: flex-end;
`;

const Wrapper2 = styled.div`
  box-sizing: border-box;
  width: 85%;
  padding: 0.5em;
`;

const CommentWrapper = styled.div`
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-top: 10px;
`;

const IssueWrapper = styled.div`
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-top: 10px;
`;

const IssueContent = (props) => {
  const { issue } = props;
  return (
    <WhoreWrapper>
      <ContentWrapper>
        <Wrapper1>
          <Img />
        </Wrapper1>
        <Wrapper2>
          <IssueWrapper>
            <IssueContentHeader issue={issue} writer />
            <Span>{issue.content ? issue.content : ''}</Span>
          </IssueWrapper>
        </Wrapper2>
      </ContentWrapper>
      {issue.comments
        ? issue.comments.map((v) => {
            return (
              <ContentWrapper>
                <Wrapper1>
                  <Img />
                </Wrapper1>
                <Wrapper2>
                  <CommentWrapper key={v.cid}>
                    <IssueContentHeader issue={v} writer={false} />
                    <Span>{v.content}</Span>
                  </CommentWrapper>
                </Wrapper2>
              </ContentWrapper>
            );
          })
        : ''}
    </WhoreWrapper>
  );
};

export default IssueContent;
