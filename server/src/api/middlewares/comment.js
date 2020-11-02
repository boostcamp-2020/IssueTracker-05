import commentService from '@services/comment';

const checkWritenUser = async (req, res, next) => {
  const { cid } = req.params;
  const { uid } = req.user;
  try {
    const comment = await commentService.getComment(cid);
    if (comment.uid !== uid) {
      return res.status(400).json({
        message: '댓글을 쓴 사용자가 아닙니다.',
      });
    }
  } catch (err) {
    return res.status(400).json(err);
  }
  next();
};

export default { checkWritenUser };
