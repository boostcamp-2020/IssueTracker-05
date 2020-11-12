import { sign } from '@system/axios/config';

const localLogin = async (body) => {
  try {
    const response = await sign.post('/login', {
      ...body,
      resourceServer: 'local',
    });
    console.log(response);
    if (response.status === 200) {
      localStorage.setItem('token', response.data.token);
      localStorage.setItem('user', response.data.user);
      // 리다이렉트 만들기
      alert('로그인이 성공됐습니다.');
    };
  } catch (err) {
    alert('로그인이 실패하였습니다.');
    // 리다이렉트 만들기
  }
};

const signup = async (body) => {
  const response = await sign.post('/signup', body);
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

export { localLogin, signup, checkId };
