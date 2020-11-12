import { useReducer } from 'react';

const getMilestones = async () => {
  const milestoneList = 'k';
  return milestoneList.data;
};

const initialState = {
  title: '',
  dueDate: '',
  desc: '',
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'CHANGE_HANDLER':
      console.log(state);
      return { ...state, [action.name]: action.value };
    case 'COMPLETE':
      return { ...initialState };
    default:
      return state;
  }
};

const treatState = () => {
  console.log(getMilestones);
  return [];
};

export default treatState;
