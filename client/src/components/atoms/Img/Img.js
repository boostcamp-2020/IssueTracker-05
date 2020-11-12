import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const ImgStyle = styled.img`
  display: block;
  width: 60px;
  height: 60px;
`;

const Img = (props) => {
  return <ImgStyle src={props.url} />;
};

Img.propTypes = {
  url: PropTypes.string,
};

Img.defaultProps = {
  url: 'https://images.mypetlife.co.kr/content/uploads/2019/09/06150205/cat-baby-4208578_1920.jpg',
};

export default Img;
