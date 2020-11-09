import db from '@models';

export default async (cid) => {
  try {
    await db.comment.destroy({ where: { cid } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
