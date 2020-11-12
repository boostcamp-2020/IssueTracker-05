import db from '@models';

export default async (iid) => {
  try {
    await db.comment.destroy({ where: { iid } });
    await db.issue.destroy({ where: { iid } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
