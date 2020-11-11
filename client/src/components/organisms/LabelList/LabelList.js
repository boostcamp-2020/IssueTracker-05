import React, { useRef } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

import LabelListTitle from '@molecules/LabelListTitle';
import LabelInform from '@molecules/LabelInform';

const WholeWrapper = styled.div`
  display: flex;
  flex-direction: column;
  width: 100%;
  padding: 1em;
  border: 1px solid black;
`;

const LabelList = (props) => {
  return (
    <WholeWrapper>
      <LabelListTitle name={`${props.labelList.length} label`} />
      {props.labelList.map((value) => (
        <LabelInform
          {...value}
          key={value.name}
          onDelete={props.onDelete}
          onEdit={props.updateLabel}
        />
      ))}
    </WholeWrapper>
  );
};

LabelList.propTypes = {
  labelList: PropTypes.arrayOf(PropTypes.string),
  type: PropTypes.string,
};

LabelList.defaultProps = {
  labelList: [],
  type: 'default',
};

export default LabelList;
