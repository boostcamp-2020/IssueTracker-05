import db from '@models';

export default async (content, cid) => {
  try {
    await db.comment.update({ content }, { where: { cid } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
