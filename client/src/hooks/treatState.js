import React, { useReducer } from 'react';
import * as axios from './axios/index.js';

const reducer = (state, action) => {
  switch (action.type) {
    case 'GET_LABELS':
      return {
        labels: state.labels.concat('axios.getLabels'),
      };
    case 'CHANGE_lABEL_INFORM_CREATE':
      console.log(state, action);
      return { ...state, [action.name]: [action.value] };
    case 'RESET_LABEL_INFORM_CREATE':
      return action.initialState;
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, {
    labels: [],
    labelName: '',
    labelDesc: '',
    labelColor: '',
  });

  const getLabels = () => {
    dispatch({
      type: 'GET_LABELS',
    });
  };

  const onLabelInformCreate = (e) => {
    const { name, value } = e.target;
    dispatch({
      type: 'CHANGE_lABEL_INFORM_CREATE',
      name,
      value,
    });
  };

  const resetLabelInformCreate = () => {
    dispatch({
      type: 'RESET_LABEL_INFORM_CREATE',
      initialState: { labelName: '', labelDesc: '', labelColor: '' },
    });
  };

  return [state, getLabels, onLabelInformCreate, resetLabelInformCreate];
};

export default treatState;
