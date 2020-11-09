import db from '@models';

export default async (iid) => {
  try {
    const comments = db.comment.findAll({
      include: db.user,
      where: { iid },
    });
    return comments;
  } catch (err) {
    throw new Error(err);
  }
};
