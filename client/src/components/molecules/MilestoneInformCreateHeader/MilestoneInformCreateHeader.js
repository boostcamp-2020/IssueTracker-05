import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Span from '@atoms/Span';

const WhoreWrapper = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  padding: 0 1em;
`;

const MilestoneInformCreateHeader = (props) => {
  const header = props.mid ? 'Edit Milestone' : 'Create Milestone';
  return (
    <WhoreWrapper>
      <Span fontSize="3em">{header}</Span>
    </WhoreWrapper>
  );
};

export default MilestoneInformCreateHeader;
