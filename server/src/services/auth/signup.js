import db from '@models';
import bcrypt from '@services/auth/passwordBcrypt';

const isDuplicated = async (userId) => {
  const user = await db.user.findOne({ where: { userId } });
  if (user) return false;
  return true;
};

const createUser = async (userId, password, nickname) => {
  try {
    const encryptedPassword = await bcrypt.hashPw(password);
    const user = await db.user.create({
      userId: `${userId}`,
      nickname: `${nickname}`,
      password: `${encryptedPassword}`,
      OAuth: false,
      resourceServer: 'local',
    });
    return user;
  } catch (err) {
    throw new Error(err);
  }
};

export default { isDuplicated, createUser };
