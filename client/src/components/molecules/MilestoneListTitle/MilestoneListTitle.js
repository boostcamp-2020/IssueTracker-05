import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import Span from '@atoms/Span';
import Tab from '@atoms/Tab';

const Wrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  padding: 0.5em 1em;
  gap: 100px;
  display: flex;
  align-items: center;
  background: #ddd;
  border: 1px solid #ccc;
`;

const MilestoneListTitle = (props) => {
  return (
    <Wrapper>
      <Tab
        tabList={['Open', 'Close']}
        state={props.state}
        tabChange={props.tabChange}
      />
    </Wrapper>
  );
};

MilestoneListTitle.propTypes = {
  fontSize: PropTypes.string,
  type: PropTypes.oneOf(['main-heder', 'default']),
};

MilestoneListTitle.defaultProps = {
  fontSize: '1em',
  type: 'default',
};

export default MilestoneListTitle;
