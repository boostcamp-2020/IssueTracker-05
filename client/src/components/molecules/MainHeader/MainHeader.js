import React from 'react';
import PropTypes from 'prop-types';
import styled from 'styled-components';
import Span from '@atoms/Span';

const Wrapper = styled.div`
  box-sizing: content-box;
  width: 100%;
  justify-content: center;
  align-items: center;
  background: #000;
  padding: 1em 0;
`;

const MainHeader = (props) => {
  return (
    <Wrapper>
      <Span {...props}>IssueTracker</Span>
    </Wrapper>
  );
};

MainHeader.propTypes = {
  type: PropTypes.oneOf(['main-header', 'default']),
  fontSize: PropTypes.string,
};

MainHeader.defaultProps = {
  fontSize: '3em',
  type: 'main-header',
};

export default MainHeader;
