import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Span from '@atoms/Span';

const Wrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  align-items: flex-end;
  border: 1px solid #ccc;
  padding-top: 1em;
  padding-left: 1.5em;
  background: #ccc;
`;

const IssueCommentCreateHeader = (props) => {
  return (
    <Wrapper>
      <Span type="issueCommentCreate">Write</Span>
    </Wrapper>
  );
};

export default IssueCommentCreateHeader;
