import axios from 'axios';
import db from '@models';
import jwt from 'jsonwebtoken';
import passportConfig from '@config/passport';

const githubLogin = async (token) => {
  const response = await axios.get('https://api.github.com/user', {
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });
  const { data } = response;
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

export default { githubLogin };
