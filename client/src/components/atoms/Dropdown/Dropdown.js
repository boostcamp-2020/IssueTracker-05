import React, { useState } from 'react';
import styled from 'styled-components';

import Label from '@atoms/Label';

const displayControl = ({ drop }) => (drop ? 'block' : 'none');

const DropdownContent = styled.div`
  display: ${displayControl}; /*none*/
  position: absolute;
  min-width: 20em;
  right: -50%;
  background-color: white;
  z-index: 1;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  border-radius: 0.3em;
  overflow: hidden;
  box-sizing: border-box;
`;

const DropdownButton = styled.div`
  position: relative;
  display: inline-block;
  &:hover {
    cursor: pointer;
  }
`;

const Title = styled.div`
  background-color: #95a5a6;
  height: 2em;
  text-align: center;
  margin: 0;
  &:hover {
    cursor: auto;
  }
`;

const Content = styled.div`
  min-height: 2em;
  &:hover {
    background-color: #ecf0f1;
    cursor: pointer;
  }
`;

const Dropdown = (props) => {
  const [drop, setDrop] = useState(false);
  let contentList;
  if (!props.contentList) {
    contentList = [];
  } else {
    contentList = props.contentList;
  }
  const handleClick = (e) => {
    if (!e.target.closest(DropdownButton) && drop) {
      setDrop(false);
    }
  };
  React.useEffect(() => {
    document.addEventListener('click', handleClick);
    return () => {
      document.removeEventListener('click', handleClick);
    };
  }, []);
  return (
    <DropdownButton onClick={() => setDrop((drop) => !drop)}>
      <div>{props.name}</div>
      <DropdownContent drop={drop}>
        <Title>{props.title}</Title>
        {contentList.map((value, index) => (
          <Content key={index}>{value.name}</Content>
        ))}
      </DropdownContent>
    </DropdownButton>
  );
};

export default Dropdown;
