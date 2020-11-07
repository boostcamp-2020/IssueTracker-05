import db from '@models';

export default async () => {
  try {
    const users = db.user.findAll({
      attributes: ['uid', 'userId', 'nickname', 'image'],
    });
    return users;
  } catch (err) {
    throw new Error(err);
  }
};
