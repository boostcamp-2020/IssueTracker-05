import { main } from '@system/axios/config';

export const createComment = async (body) => {
  const comment = await main.post('/comment', body);
  return comment.status;
};

export const patchComment = async (cid, body) => {
  const comment = await main.patch(`/comment/${cid}`, body);
  return comment.status;
};

export const deleteComment = async (cid) => {
  const comment = await main.delete(`/comment/${cid}`);
  return comment.status;
};

export const getComments = async (iid) => {
  const comment = await main.get(`/comment/${iid}`);
  return comment.status;
};
