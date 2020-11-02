import commentService from '@services/comment';

const createComment = async (req, res) => {
  const { nickname, content } = req.body;
  try {
    await commentService.createComment(nickname, content);
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
    await commentService.patchComment(content, cid);
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
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default { createComment, patchComment, deleteComment };
