import React, { useEffect, useState } from 'react';

import styled from 'styled-components';

import SignBox from '@organisms/SignBox';
import Span from '@atoms/Span';

const WholeWrapper = styled.div`
  display: flex;
  width: 100%;
  flex-direction: column;
  box-sizing: content-box;
  background-color: #e8e8e8;
  align-items: center;
`;

export default () => {
  return (
    <WholeWrapper>
      <Span font-size="100">이슈 트래커 좀 돼라 ;;; 로그인창 박스 크기는 왜저래</Span>
      <SignBox />
    </WholeWrapper>
  );
};
