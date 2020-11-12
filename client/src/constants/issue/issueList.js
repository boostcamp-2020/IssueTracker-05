import React, { useReducer } from 'react';
import * as axios from '@system/axios/issue';

const initialState = [];

const reducer = (state, action) => {
  switch (action.type) {
    case 'GET_ISSUES':
      return [...action.issue];
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const getIssues = async () => {
    const issue = await axios.getIssues();
    console.log(issue);
    dispatch({
      type: 'GET_ISSUES',
      issue,
    });
  };

  return [state, getIssues];
};

export default treatState;
