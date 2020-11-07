import db from '@models';

export default async (cid) => {
  try {
    const comment = await db.comment.findByPk(cid);
    return comment;
  } catch (err) {
    throw new Error(err);
  }
};
