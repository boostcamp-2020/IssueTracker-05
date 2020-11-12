import { useReducer } from 'react';
import * as axios from '@system/axios/label';

const initialState = {
  prevName: '',
  name: '',
  desc: '',
  color: '',
  disabled: true,
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'CREATE_LABEL':
      return { ...initialState, disabled: !state.disabled };
    case 'UPDATE_LABEL':
      return {
        ...initialState,
        ...action.labelInfo,
        prevName: action.labelInfo.name,
      };
    case 'CANCEL_LABEL':
      return { ...initialState, disabled: false };
    case 'CHANGE_HANDLER':
      return { ...state, [action.name]: action.value };
    case 'COMPLETE':
      return { ...initialState };
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, { ...initialState });

  const createLabel = () => {
    dispatch({
      type: 'CREATE_LABEL',
    });
  };

  const updateLabel = (labelInfo) => {
    dispatch({
      type: 'UPDATE_LABEL',
      labelInfo,
    });
  };

  const cancelLabel = () => {
    dispatch({
      type: 'CANCEL_LABEL',
    });
  };

  const changeHandler = (e) => {
    const { name, value } = e.target;
    dispatch({
      type: 'CHANGE_HANDLER',
      name,
      value,
    });
  };

  const submitHandler = async () => {
    let status;
    if (state.prevName === '') {
      status = await axios.createLabel(state.name, state.desc, state.color);
    } else {
      status = await axios.patchLabel(
        state.prevName,
        state.name,
        state.color,
        state.desc,
      );
    }
    if (status === 200) {
      dispatch({
        type: 'COMPLETE',
      });
    }
  };

  return [
    state,
    createLabel,
    updateLabel,
    cancelLabel,
    changeHandler,
    submitHandler,
  ];
};

export default treatState;
