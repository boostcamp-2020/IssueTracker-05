import { main } from '@system/axios/config';

const localLogin = async (body) => {
  const response = await main.post('/login/local', body);
  if (response.status === 200) {
    localStorage.setItem('token', response.data.token);
    localStorage.setItem('user', response.data.user);
    // 리다이렉트 만들기
  } else {
    // 리다이렉트 만들기
  }
};

const signup = async (body) => {
  const response = await main.post('/signup', body);
  if (response.status === 200) {
    // 알람메세지 후 리다이렉트
  } else {
    console.log(response.data.message); // 알람메세지로
  }
};

const checkId = async (id) => {
  const response = await main.post('/signup/check-id', {
    userId: id,
  });
  if (response.status === 200) {
    return true;
  }
  return false;
};

export default { localLogin, signup, checkId };
