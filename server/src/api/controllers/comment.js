import commentService from '@services/comment';

const getComments = async (req, res) => {
  const { iid } = req.params;
  try {
    const comments = await commentService.readComments(iid);
    return res.status(200).json(comments);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const createComment = async (req, res) => {
  const { content, iid } = req.body;
  const { uid } = req.user;
  try {
    await commentService.createComment(content, uid, iid);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const patchComment = async (req, res) => {
  const { cid } = req.params;
  const { content } = req.body;
  try {
    await commentService.updateComment(content, cid);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const deleteComment = async (req, res) => {
  const { cid } = req.params;
  try {
    await commentService.deleteComment(cid);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default { getComments, createComment, patchComment, deleteComment };
