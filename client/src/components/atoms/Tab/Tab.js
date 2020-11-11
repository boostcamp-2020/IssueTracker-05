import React from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const TabListStyle = styled.ul`
  list-style-type: none;
  display: flex;
  white-space: nowrap;
  align-items: center;
  justifiy-content: center;
  text-decoration: none;
`;

const TabStyle = styled.li`
  box-sizing: border-box;
  border: 1px solid #e5e6e6;
  border-radius: 2px;
  padding: 0.5em 2em;
  &:hover {
    background-color: #3498db;
    color: white;
    cursor: pointer;
  }
`;

const SelectedTabStyle = styled(TabStyle)`
  box-sizing: border-box;
  border: 1px solid #e5e6e6;
  border-radius: 2px;
  padding: 0.5em 2em;
  background-color: #3498db;
  color: white;
`;

const Tab = (props) => {
  const { tabList } = props;
  return (
    <TabListStyle>
      {tabList.map((tabName, index) => {
        if (index !== props.state) {
          return (
            <TabStyle onClick={() => props.tabChange(index)}>
              {tabName}
            </TabStyle>
          );
        }
        return <SelectedTabStyle>{tabName}</SelectedTabStyle>;
      })}
    </TabListStyle>
  );
};

Tab.propTypes = {
  tabList: PropTypes.arrayOf(PropTypes.string).isRequired,
};

export default Tab;
