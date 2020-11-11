import React, { useState } from 'react';
import styled from 'styled-components';

import MilestoneListTitle from '@molecules/MilestoneListTitle';
import MilestoneInform from '@molecules/MilestoneInform';

const Wrapper = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  padding: 1em;
`;

const MilestoneList = (props) => {
  const [tab, setTab] = useState(0);
  return (
    <Wrapper>
      <MilestoneListTitle state={tab} tabChange={setTab} />
      {tab === 0
        ? props.milestoneList
            .filter((v) => v.isOpen)
            .map((milestone) => (
              <MilestoneInform {...milestone} key={milestone.mid} />
            ))
        : props.milestoneList
            .filter((v) => !v.isOpen)
            .map((milestone) => (
              <MilestoneInform {...milestone} key={milestone.mid} />
            ))}
    </Wrapper>
  );
};

export default MilestoneList;
