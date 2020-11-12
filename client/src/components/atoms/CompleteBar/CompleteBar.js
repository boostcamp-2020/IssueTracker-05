import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const setWidth = ({ width }) => `${width}px`;
const setProgress = ({ progress }) => `${progress}%`;

const CompleteBarStyle = styled.div`
  width: ${setWidth};
  height: 50px;
  position: relative;
  background: #ccc;
  border: none;
  border-radius: 6px;
  &:after {
    content: '';
    position: absolute;
    background: #000;
    top: 0;
    bottom: 0;
    left: 0;
    width: ${setProgress};
    border-radius: 6px;
  }
`;

const CompleteBar = (props) => <CompleteBarStyle {...props} />;

CompleteBar.propTypes = {
  width: PropTypes.number,
  progress: PropTypes.number,
};

CompleteBar.defaultProps = {
  width: 200,
  progress: 50,
};

export default CompleteBar;
