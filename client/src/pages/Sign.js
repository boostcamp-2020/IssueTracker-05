import React from 'react';

import styled from 'styled-components';

import SignBox from '@organisms/SignBox';

const WholeWrapper = styled.div`
  display: flex;
  width: 99%;
  flex-direction: column;
  padding: 20vh 0;
  box-sizing: content-box;
  background-color: #e8e8e8;
  align-items: center;
`;

export default () => {
  return (
    <WholeWrapper>
      <SignBox />
    </WholeWrapper>
  );
};
