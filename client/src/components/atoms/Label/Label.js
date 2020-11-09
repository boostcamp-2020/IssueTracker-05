import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const backgroundColor = ({ background }) => `${background}`;
const randomBackground = () => {
  const arr = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
  ];
  let res = '#';
  for (let i = 0; i < 6; i++) {
    res += arr[Math.floor(Math.random() * 16)];
  }

  return res;
};

const FontSize = ({ fontSize }) => fontSize;

const LabelStyle = styled.div`
  display: inline-flex;
  box-sizing: border-box;
  padding: 0.3em 1.2em;
  white-space: nowrap;
  align-items: center;
  justifiy-content: center;
  text-decoration: none;
  border: 1px solid #e5e6e6;
  border-radius: 6px;
  background-color: ${backgroundColor};
  color: #fff;
  font-size: ${FontSize};
  &:hover,
  &:focus,
  &:active,
  &:focus {
    outline: none;
  }
`;

const Label = (props) => <LabelStyle {...props} />;

Label.propTypes = {
  background: PropTypes.string,
  fontSize: PropTypes.string,
};

Label.defaultProps = {
  background: randomBackground(),
  fontSize: '1em',
};

export default Label;
