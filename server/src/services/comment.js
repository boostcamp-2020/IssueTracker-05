import db from '@models';

const getComment = async (cid) => {
  try {
    const comment = await db.comment.findByPk(cid);
    return comment;
  } catch (err) {
    throw new Error(err);
  }
};

const getComments = async (iid) => {
  try {
    const comments = db.comment.findAll({ where: { iid } });
    return comments;
  } catch (err) {
    throw new Error(err);
  }
};
const createComment = async (content, uid, iid) => {
  try {
    await db.comment.create({
      content,
      uid,
      iid,
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

export default {
  getComment,
  getComments,
  createComment,
  patchComment,
  deleteComment,
};
