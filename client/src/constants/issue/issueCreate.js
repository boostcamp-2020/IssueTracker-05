import { useReducer } from 'react';
import * as axios from '@system/axios/issue';
import * as user from '@system/axios/user';
import * as label from '@system/axios/label';
import * as milestone from '@system/axios/milestone';

const initialState = {
  title: '',
  content: '',
  assignees: [],
  labels: [],
  milestones: [],
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'CHANGE_HANDLER':
      console.log(state);
      return { ...state, [action.name]: action.value };
    case 'SUBMIT':
      return initialState;
    case 'GET_SIDEBAR':
      return {
        ...state,
        assignees: action.assignees,
        labels: action.labels,
        milestones: action.milestones,
      };
    default:
      return state;
  };
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const changeHandler = (e) => {
    const { name, value } = e.target;
    dispatch({
      type: 'CHANGE_HANDLER',
      name,
      value,
    });
  };

  const submit = async (title, content, assignees, labels, milestones) => {
    const body = { title, content, assignees, labels, milestones };
    await axios.createIssue(body);
    dispatch({
      type: 'SUBMIT',
    });
  };

  const getSidebar = async () => {
    const assignees = await user.getUsers();
    const labels = await label.getLabels();
    const milestones = await milestone.getMilestones();
    dispatch({
      type: 'GET_SIDEBAR',
      assignees,
      labels,
      milestones,
    });
  };

  return [state, changeHandler, submit, getSidebar];
};

export default treatState;
