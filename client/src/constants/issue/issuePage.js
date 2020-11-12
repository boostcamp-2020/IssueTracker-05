import { useReducer } from 'react';
import * as axios from '@system/axios/issue';
import * as user from '@system/axios/user';
import * as label from '@system/axios/label';
import * as milestone from '@system/axios/milestone';

const initialState = {
  issue: {},
  users: [],
  labels: [],
  milestones: [],
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'GET_ISSUE':
      return { ...state, issue: action.issue };
    case 'GET_ASSIGNEES':
      return { ...state, users: action.users };
    case 'GET_LABELS':
      return { ...state, labels: action.labels };
    case 'GET_MILESTONES':
      return { ...state, milestones: action.milestones };
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

  const getAssignees = async () => {
    const users = await user.getUsers();
    dispatch({
      type: 'GET_ASSIGNEES',
      users,
    });
  };

  const getLabels = async () => {
    const labels = await label.getLabels();
    dispatch({
      type: 'GET_LABELS',
      labels,
    });
  };

  const getMilestones = async () => {
    const milestones = await milestone.getMilestones();
    dispatch({
      type: 'GET_MILESTONES',
      milestones,
    });
  };

  return [state, getIssue, getAssignees, getLabels, getMilestones];
};

export default treatState;
