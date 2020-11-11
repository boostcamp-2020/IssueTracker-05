import React from 'react';
import styled, { css } from 'styled-components';
import PropTypes from 'prop-types';
import { font } from 'styled-theme';
import { ifProp } from 'styled-tools';

const fontSize = ({ height }) => `${height / 35.5555555556}rem`;

const styles = css`
  font-family: ${font('primary')};
  display: block;
  width: 96%;
  padding: ${ifProp(
    { type: 'textarea' },
    '0.4444444444em',
    '0 0.4444444444em',
  )};
  height: ${ifProp({ type: 'textarea' }, 'auto', '2.2222222222em')};
  font-size: ${fontSize};
  border: 1px solid #e5e6e6;
  border-radius: 2px;
`;

const StyledInput = styled.input`
  ${styles}
`;

const StyledTextarea = styled.textarea`
  ${styles}
`;

const Input = (props) => {
  const { type } = props;
  if (type === 'textarea') {
    return <StyledTextarea {...props} />;
  }
  return <StyledInput {...props} />;
};

Input.propTypes = {
  type: PropTypes.oneOf(['text', 'date', 'textarea', 'date']),
};

Input.defaultProps = {
  type: 'text',
  height: 40,
};

export default Input;
