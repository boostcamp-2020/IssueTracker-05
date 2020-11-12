import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Span from '@atoms/Span';
import Button from '@atoms/Button';

const WhoreWrapper = styled.div`
  box-sizing: border-box;
  padding: 1em;
  width: 100%;
  display: flex;
  flex-direction: column;
  border: 1px solid blue;
  margin: 20px 0;
`;

const TitleWrapper = styled.div`
  box-sizing: border-box;
  width: 60%;
  display: flex;
  gap: 15px;
  align-items: center;
`;

const Wrapper1 = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

const Wrapper2 = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  gap: 15px;
  align-items: center;
`;

const IssueHeader = (props) => {
  const {issue} = props;
  return (
    <WhoreWrapper>
      <Wrapper1>
        <TitleWrapper>
          <Span fontSize="2em">{issue.title ? issue.title : ''}</Span>
          <Span fontSize="2em">#{issue.iid ? issue.iid : ''}</Span>
        </TitleWrapper>
        <Button type="edit">Edit</Button>
      </Wrapper1>
      <Wrapper2>
        <Span type={ props.spanType }>{issue.isOpend ? issue.isOpend : ''}</Span>
        <Span>
          {issue.comments ? issue.comments.length : ''} comments
        </Span>
      </Wrapper2>
    </WhoreWrapper>
  );
};

IssueHeader.propTypes = {
  spanType: PropTypes.oneOf(['close', 'open']),
};

IssueHeader.defaultProps = {
  spanType: 'close',
};

export default IssueHeader;
