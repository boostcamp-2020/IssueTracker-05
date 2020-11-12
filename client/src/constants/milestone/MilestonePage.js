import { useReducer } from 'react';
import * as axios from '@system/axios/milestone';

const reducer = (state, action) => {
  switch (action.type) {
    case 'SET_MILESTONE_CNT':
      return { ...state, milestoneCnt: state.milestoneList.length };
    case 'GET_MILESTONES':
      return { ...state, milestoneList: action.list.concat() };
    case 'DELETE_MILESTONE':
      return {
        ...state,
        milestoneList: state.milestoneList.filter((v) => v.mid !== action.mid),
      };
    case 'CHANGE_STATUS_MILESTONE':
      return {
        ...state,
        milestoneList: state.milestoneList.map((v) =>
          v.mid === action.mid ? { ...v, isOpen: !v.isOpen } : v,
        ),
      };
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, {
    milestoneCnt: 0,
    milestoneList: [],
  });

  const setMilestoneCnt = () => {
    dispatch({
      type: 'SET_MILESTONE_CNT',
    });
  };

  const getMilestones = async () => {
    const list = await axios.getMilestones();
    dispatch({
      type: 'GET_MILESTONES',
      list,
    });
  };

  const deleteMilestone = async (mid) => {
    await axios.deleteMilestone(mid);
    dispatch({
      type: 'DELETE_MILESTONE',
      mid,
    });
  };

  const changeMilestoneStatus = async (mid) => {
    const target = state.milestoneList.filter((v) => v.mid === mid);
    await axios.updateMilestone(mid, { isOpen: !target[0].isOpen });
    dispatch({
      type: 'CHANGE_STATUS_MILESTONE',
      mid,
    });
  };

  return [
    state,
    setMilestoneCnt,
    getMilestones,
    deleteMilestone,
    changeMilestoneStatus,
  ];
};

export default treatState;
