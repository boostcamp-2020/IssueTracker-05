import React, { useState } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import Span from '@atoms/Span';
import CompleteBar from '@atoms/CompleteBar';
import Button from '@atoms/Button';

const WhoreWrapper = styled.div`
  box-sizing: border-box;
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.5em 1em;
  border: 1px solid #ccc;
`;

const ContentWrapper1 = styled.div`
  box-sizing: border-box;
  width: 45%;
  display: flex;
  flex-direction: column;
  align-items: start;
`;

const ContentWrapper2 = styled.div`
  box-sizing: border-box;
  width: 45%;
  display: flex;
  flex-direction: column;
  align-items: center;
`;

const SpanWrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  align-items: center;
  float: left;
  gap: 30px;
  width: 60%;
  margin-left: 95px;
`;

const ButtonWrapper = styled.div`
  box-sizing: border-box;
  display: flex;
  gap: 10px;
  align-items: center;
  width: 300px;
`;

const weekDay = [
  'JAN',
  'FEB',
  'MAR',
  'APR',
  'MAY',
  'JUN',
  'JUL',
  'AUG',
  'SEP',
  'OCT',
  'NOV',
  'DEC',
];

const returnDate = (date) => {
  if (!date) {
    return '';
  }
  const refineDate = new Date(date);
  refineDate.getMonth();
  return `Due by ${
    weekDay[refineDate.getMonth()]
  } ${refineDate.getDate()} ${refineDate.getFullYear()}`;
};

const MilestoneInform = (props) => {
  let complete;

  if (props.issues.length !== 0) {
    complete = Math.floor(
      (100 * props.issues.filter((v) => v.isOpen).length) / props.issues.length,
    );
  } else {
    complete = 0;
  }
  const date = returnDate(props.dueDate);
  const changeButton = props.isOpen ? 'Close' : 'Open';

  return (
    <WhoreWrapper>
      <ContentWrapper1>
        <Span fontSize="2.5em">{props.title}</Span>
        <Span>{date}</Span>
        <Span {...props}>{props.content}</Span>
      </ContentWrapper1>
      <ContentWrapper2>
        <CompleteBar width="300" progress={complete} />
        <SpanWrapper>
          <div>
            <Span>{complete}% complete</Span>
          </div>
          <div>
            <Span>{props.open} open</Span>
          </div>
        </SpanWrapper>
        <ButtonWrapper>
          <Button type="edit">Edit</Button>
          <Button type="delete" onClick={() => props.onChange(props.mid)}>
            {changeButton}
          </Button>
          <Button type="cancel" onClick={() => props.onDelete(props.mid)}>
            Delete
          </Button>
        </ButtonWrapper>
      </ContentWrapper2>
    </WhoreWrapper>
  );
};

MilestoneInform.propTypes = {
  title: PropTypes.string,
  dueDate: PropTypes.string,
  content: PropTypes.string,
  open: PropTypes.number,
  close: PropTypes.number,
  mid: PropTypes.number,
};

MilestoneInform.defaultProps = {
  title: 'nonono',
  dueDate: null,
  content: null,
  open: 2,
  close: 2,
  mid: 1,
};

export default MilestoneInform;
