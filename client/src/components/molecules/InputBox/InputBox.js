import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Input from '@atoms/Input';
import Span from '@atoms/Span';

const InputBoxStyle = styled.div`
  width: 100%;
`;

const InputBox = (props) => {
  const { children } = props;
  const inputProps = { ...props };
  delete inputProps.children;
  return (
    <InputBoxStyle>
      <Span {...props}>
        <b>{children}</b>
      </Span>
      <Input {...inputProps} />
    </InputBoxStyle>
  );
};

InputBox.propTypes = {
  type: PropTypes.string,
  children: PropTypes.string,
};

InputBox.defaultProps = {
  type: 'text',
  children: 'input',
};

export default InputBox;
