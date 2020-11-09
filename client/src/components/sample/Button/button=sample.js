import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { font, palette } from 'styled-theme';

const buttonStyle = styled.button`
  display: inline-flex;
  height: 2.5em;
  align-items: center;
  font-family: ${font('primary')};
  white-space: nowrap; /* 공백 문자 처리 -> 줄바꿈 없이 한줄로 */
  border-radius: 0.2em;
  justify-content: center;
  text-decoration: none;
  appearance: none;
  padding: 0 1em;
  box-sizing: border-box;
  transition: background-color 250ms ease-out, color 250ms ease-out,
    border-color 250ms ease-out; /*https://www.w3schools.com/css/css3_transitions.asp*/
`;

/*
버튼마다 추가 옵션
border
cursor
pointer-events
color, backgroundcolor
*/

const Button = (props) => <buttonStyle {...props} />;

Button.PropTypes = {
  ButtonFontSize: PropTypes.number,
  ButtonDisabled: PropTypes.bool,
  ButtonWidth: PropTypes.number,
  ButtonHeight: PropTypes.number,
  ButtonFont: PropTypes.string,
};

Button.defaultProps = {
  palette: 'primary',
  type: 'button',
};

export default Button;
