import { useReducer } from 'react';

const initialState = {
  userId: '',
  password: '',
  nickname: '',
};

const reducer = (state, action) => {
  switch (action.type) {
    case 'CHANGE_HANDLER':
      return { ...state, [action.name]: action.value };
    default:
      return state;
  }
};

const treatState = () => {
  const [state, dispatch] = useReducer(reducer, { ...initialState });

  const changeHandler = (e) => {
    const { name, value } = e.target;
    dispatch({
      type: 'CHANGE_HANDLER',
      name,
      value,
    });
  };

  return [state, changeHandler];
};

export default treatState;
