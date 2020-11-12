import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const justifyContent = ({ type }) =>

  type === 'main-header' ? 'center' : 'start';

const setPadding = ({type}) => {
  if (type === 'issueCommentCreate') {
    return '1em 0.5em';
  }
  return '0.3em 0em';
};

const fontColor = ({ type }) => {
  switch (type) {
    case 'main-header':
      return '#fff';
    case 'open':
      return '#fff';
    case 'close':
      return '#fff';
    default:
      return '#000';
  }
};

const backgroundColor = ({ type }) => {
  switch (type) {
    case 'close':
      return '#d33';
    case 'open':
      return '#5a5';
    case 'issueTitle':
      return '#ccc';
    case 'issueCommentCreate':
      return '#fff';
    default:
      return 'transparent';
  }
};

const SpanStyle = styled.span`
  display: flex;
  box-sizing: border-box;
  padding: ${setPadding};
  white-space: nowrap;
  justify-content: ${justifyContent};
  align-items: center;
  text-decoration: none;
  border: none;
  background-color: ${backgroundColor};
  color: ${fontColor};
  font-size: ${(props) => props.fontSize};
  white-space: normal;
  border-radius: 5px;
`;

const Span = (props) => <SpanStyle {...props} />;

Span.propTypes = {
  type: PropTypes.oneOf([
    'main-header',
    'default',
    'open',
    'close',
    'issueTitle',
    'issueCommentCreate',
  ]),
  fontSize: PropTypes.string,
};

Span.defaultProps = {
  fontSize: '1em',
  type: 'default',
};

export default Span;
