import React, { useReducer } from 'react';
import * as axios from '@system/axios/issue';

const initialState = {
  issue: {},
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'GET_ISSUE':
      return { ...state, issue: action.issue };
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const getIssue = async (iid) => {
    const issue = await axios.getIssue(iid);
    dispatch({
      type: 'GET_ISSUE',
      issue,
    });
  };

  return [state, getIssue];
};

export default treatState;
