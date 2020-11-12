import React, {useState} from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';

import Button from '@atoms/Button';
import Span from '@atoms/Span';

const WholeWrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border: 1px solid #ccc;
  padding: 0.5em;
`;

const InnerWrapper1 = styled.div`
  box-sizing: border-box;
  width: 30%;
  display: flex;
  align-items: center;
  gap: 15px;
`;

const InnerWrapper2 = styled.div`
  box-sizing: border-box;
  width: 30%;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 15px;
`;

const IssueContentHeader = (props) => {
  const { issue } = props;
  return (
    <WholeWrapper>
      <InnerWrapper1>
        <Span>{issue.user ? issue.user.nickname : ''}</Span>
        <Span>
          최종 수정:
          {issue.createdAt ? issue.createdAt : ''}
        </Span>
      </InnerWrapper1>
      <InnerWrapper2>
        {props.writer && <Span>Owner</Span>}
        <Button type="edit">Edit</Button>
      </InnerWrapper2>
    </WholeWrapper>
  );
};

IssueContentHeader.propTypes = {
  writer: PropTypes.bool,
};

IssueContentHeader.defaultProps = {
  title: '행복하다',
  iid: 2,
  closedAt: '최종 수정 날짜 입력하시오',
  writer: true,
};

export default IssueContentHeader;
