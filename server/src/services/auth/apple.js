import axios from 'axios';
import db from '@models';
import jwt from 'jsonwebtoken';
import passportConfig from '@config/passport';

const appleLogin = async (token) => {
  const response = await axios.get(
    'https://api.appstoreconnect.apple.com/v1/apps', // 주소 변경 https://developer.apple.com/documentation/appstoreconnectapi/generating_tokens_for_api_requests
    {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    },
  );
  const { data } = response; // 데이터가 뭐가 오는지 확인하기
  const user = await db.user.findOrCreate({
    where: {
      userId: data.id,
      resourceServer: 'github',
      nickname: data.login,
      OAuth: true,
    },
  });
  const userToken = jwt.sign(user[0].toJSON(), passportConfig.secretOrKey);
  return { user, token: userToken };
};

export default { appleLogin };
