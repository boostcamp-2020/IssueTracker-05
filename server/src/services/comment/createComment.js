import db from '@models';

export default async (content, uid, iid) => {
  try {
    await db.comment.create({
      content,
      uid,
      iid,
    });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
