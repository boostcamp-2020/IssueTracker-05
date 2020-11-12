import { sign } from '@system/axios/config';

const localLogin = async (body) => {
  try {
    const response = await sign.post('/login', {
      ...body,
      resourceServer: 'local',
    });
    if (response.status === 200) {
      localStorage.setItem('token', response.data.token);
      localStorage.setItem('user', response.data.user);
      alert('로그인이 성공됐습니다.');
      return true;
    }
    return false;
  } catch (err) {
    alert('로그인이 실패하였습니다.');
    return false;
  }
};

const signup = async (body) => {
  try {
    const response = await sign.post('/signup', body);
    if (response.status === 200) {
      alert('회원가입에 성공하셨습니다.');
      return true;
    }
    return false;
  } catch (err) {
    alert('회원가입에 실패하였습니다.');
    return false;
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

export { localLogin, signup, checkId };
