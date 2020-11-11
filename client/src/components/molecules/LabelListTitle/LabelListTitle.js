import React from 'react'
import styled from 'styled-components'
import PropTypes from 'prop-types'
import Span from '@atoms/Span';

const Wrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  padding: 0.5em 1em;
  display: flex;
  align-items: center;
  justify-items: center;
  background: #ddd;
  border: 1px solid #ccc;
`;

const LabelListTitle = (props) => {
  return (
    <Wrapper>
      <Span {...props}>{props.name}</Span>
    </Wrapper>
  );
};

LabelListTitle.propTypes = {
  fontSize: PropTypes.string,
  name: PropTypes.string,
  type: PropTypes.oneOf(['default']),
};

LabelListTitle.defaultProps = {
  fontSize: '1em',
  name: 'nonono!',
  type: 'default',
};

export default LabelListTitle;
