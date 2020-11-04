import { Strategy } from 'passport-local';

import bcrypt from '@services/passwordBcrypt';
import db from '@models';

const localConfig = {
  usernameField: 'userId',
  passwordField: 'password',
  session: false,
};

const localFunction = async (userId, password, done) => {
  const user = await db.user.findOne({ where: { userId } });
  if (!user) {
    return done(null, false, { message: '찾는 아이디가 없습니다.' });
  }
  const isCorrectPassword = await bcrypt.checkPw(password, user.password);
  if (!isCorrectPassword) {
    return done(null, false, { message: '비밀번호가 다릅니다.' });
  }
  return done(null, user);
};

export default new Strategy(localConfig, localFunction);
