import { useReducer } from 'react';
import * as axios from '@system/axios/milestone';
import { useHistory } from 'react-router-dom';

const initialState = {
  title: '',
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
  const [state, dispatch] = useReducer(reducer, initialState);

  const changeHandler = (e) => {
    const { name, value } = e.target;
    dispatch({
      type: 'CHANGE_HANDLER',
      name,
      value,
    });
  };

  const submitHandler = async (title, dueDate, content) => {
    const body = { title, dueDate, content };
    await axios.createMilestone(body);
    dispatch({
      type: 'COMPLETE',
    });
    const history = useHistory();
    history.push('/');
  };

  return [state, changeHandler, submitHandler];
};

export default treatState;
