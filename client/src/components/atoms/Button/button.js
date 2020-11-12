import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { font, palette } from 'styled-theme';
import { ifProp } from 'styled-tools';

const backgroundColor = ({ type }) => {
  switch (type) {
    case 'create':
      return palette(0);
    default:
      break;
  }
  return palette(1);
};

const fontColor = ({ type }) => {
  switch (type) {
    case 'create':
      return 'white';
    default:
      break;
  }
  return '#4c5864';
};

const ButtonStyle = styled.button`
  display: inline-flex;
  box-sizing: border-box;
  padding: 0.3em 1.2em;
  white-space: nowrap;
  align-items: center;
  justifiy-content: center;
  text-decoration: none;
  font-family: ${font('primary')};
  cursor: ${ifProp('disabled', 'default', 'pointer')};
  border: 1px solid #e5e6e6;
  border-radius: 6px;
  background-color: ${backgroundColor};
  color: ${fontColor}; /*https://www.w3schools.com/css/css3_transitions.asp*/
  font-size: ${(props) => props.fontSize};
  transition: all 0.3s ease-out;
  opacity: ${ifProp('disabled', '0.5', false)};
  &:hover,
  &:focus,
  &:active {
    filter: ${ifProp(
      { type: 'cancel' },
      false,
      ifProp(
        { type: 'edit', disabled: false },
        'blue',
        ifProp({ disabled: false }, 'brightness(0.9)', false),
      ),
    )};
    color: ${ifProp(
      { type: 'cancel', disabled: false },
      'red',
      ifProp({ type: 'edit', disabled: false }, 'blue', false),
    )};
  }
  &:focus {
    outline: none;
  }
`;

/*
버튼마다 추가 옵션
border
cursor
pointer-events
color, backgroundcolor

버튼 종류
기본 - white
캔슬 - 빨간 글씨
disable
만들기 - 초록 배경
*/

// edit , delete 버튼 추가

const Button = (props) => <ButtonStyle {...props} />;

Button.propTypes = {
  type: PropTypes.oneOf(['default', 'cancel', 'create', 'edit']),
  fontSize: PropTypes.string,
  disabled: PropTypes.bool,
};

Button.defaultProps = {
  fontSize: '1em',
  palette: 'button',
  disabled: false,
  type: 'default',
};

export default Button;
