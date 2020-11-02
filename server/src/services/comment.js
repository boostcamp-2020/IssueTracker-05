import db from '@models';

const createComment = async (nickname, content) => {
  try {
    const user = await db.user.findOne({ where: { nickname } });
    const { uid } = user;
    await db.comment.create({
      nickname,
      content,
      uid,
      iid: 20,
    });
  } catch (err) {
    throw new Error(err);
  }
};

const patchComment = async (content, cid) => {
  try {
    await db.comment.update({ content }, { where: { cid } });
  } catch (err) {
    throw new Error(err);
  }
};

const deleteComment = async (cid) => {
  try {
    await db.comment.destroy({ where: { cid } });
  } catch (err) {
    throw new Error(err);
  }
};

export default { createComment, patchComment, deleteComment };
