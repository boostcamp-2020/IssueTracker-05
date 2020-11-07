import { Strategy } from 'passport-local';
import jwt from 'jsonwebtoken';

import bcrypt from '@services/auth/passwordBcrypt';
import passportConfig from '@config/passport';
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
  const token = jwt.sign(user.toJSON(), passportConfig.secretOrKey);
  return done(null, { user, token });
};

export default new Strategy(localConfig, localFunction);
