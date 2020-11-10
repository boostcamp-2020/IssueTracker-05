import db from '@models';

export default async (content, cid) => {
  try {
    if (content === '') {
      throw new Error('댓글의 내용은 필수로 작성해주셔야 합니다.');
    }
    await db.comment.update({ content }, { where: { cid } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
