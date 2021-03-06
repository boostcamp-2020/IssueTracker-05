import db from '@models';

const getUsers = async () => {
  try {
    const users = db.user.findAll({
      attributes: ['uid', 'userId', 'nickname', 'image'],
    });
    return users;
  } catch (err) {
    throw new Error(err);
  }
};

export default { getUsers };
