import db from '@models';

export default async (iid) => {
  try {
    const comments = db.comment.findAll({
      attributes: ['cid', 'content', 'createdAt'],
      include: [
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname', 'image'],
        }
      ],
      where: { iid },
    });
    return comments;
  } catch (err) {
    throw new Error(err);
  }
};
