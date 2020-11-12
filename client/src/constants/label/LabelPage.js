import { useReducer } from 'react';
import * as axios from '@system/axios/label';

const reducer = (state, action) => {
  switch (action.type) {
    case 'SET_LABEL_CNT':
      return { ...state, labelCnt: state.labels.length };
    case 'GET_LABELS':
      return { ...state, labelList: action.list.concat() };
    case 'DELETE_LABEL':
      return {
        ...state,
        labelList: state.labelList.filter(
          (label) => label.name !== action.name,
        ),
      };
    case 'ADD_LABEL':
      return { ...state, labelList: [...action.labelList] };
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, {
    toggle: false,
    labelCnt: 0,
    labelList: [],
    labelName: '',
    labelDesc: '',
    labelColor: '',
  });

  const getLabels = async () => {
    const labelList = await axios.getLabels();
    dispatch({
      type: 'GET_LABELS',
      list: labelList,
    });
  };

  const deleteLabel = async (name) => {
    await axios.deleteLabel(name);
    dispatch({
      type: 'DELETE_LABEL',
      name,
    });
  };

  const addLabel = (oldName, labelInfo) => {
    let labelList = state.labelList.concat();
    if (oldName !== '') {
      labelList = state.labelList.filter((v) => v.name !== oldName);
    }
    labelList = [...labelList, labelInfo];
    dispatch({
      type: 'ADD_LABEL',
      labelList,
    });
  };

  return [state, getLabels, deleteLabel, addLabel];
};

export default treatState;
