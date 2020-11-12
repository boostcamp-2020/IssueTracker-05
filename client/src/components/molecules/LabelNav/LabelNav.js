import React from 'react';
import styled from 'styled-components';
import { useHistory } from 'react-router-dom';

import Tab from '@atoms/Tab';
import Button from '@atoms/Button';

const LabelNavStyle = styled.div`
  display: flex;
  height: 2.5em;
  justify-content: space-between;
  width: 100%;
  margin: 20px 0;
`;

const LabelNav = (props) => {
  const history = useHistory();

  const redirect = () => {
    history.push('/label/new-milestone');
  };

  return (
    <LabelNavStyle>
      <Tab
        tabList={['Label', 'Milestone']}
        state={props.state}
        tabChange={props.tabChange}
      />
      {props.state === 0 ? (
        <Button type="create" onClick={() => props.createLabel()}>
          New Label
        </Button>
      ) : (
        <Button type="create" onClick={redirect}>
          New Milestone
        </Button>
      )}
    </LabelNavStyle>
  );
};

LabelNav.propTypes = {};

LabelNav.defaultProps = {};

export default LabelNav;
