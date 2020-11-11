import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const justifyContent = ({ type }) =>
  type === 'main-header' ? 'center' : 'start';

const fontColor = ({ type }) => {
  switch (type) {
    case 'main-header':
      return '#fff';
    default:
      return '#000';
  }
}

const SpanStyle = styled.span`
  display: flex;
  box-sizing: border-box;
  padding: 0.3em 0;
  white-space: nowrap;
  justify-content: ${justifyContent};
  align-items: center;
  text-decoration: none;
  border: none;
  background-color: transparent;
  color: ${fontColor};
  font-size: ${(props) => props.fontSize};
`;

const Span = (props) => <SpanStyle {...props} />;

Span.propTypes = {
  type: PropTypes.oneOf(['main-header', 'default']),
  fontSize: PropTypes.string,
};

Span.defaultProps = {
  fontSize: '1em',
  type: 'default',
};

export default Span;
