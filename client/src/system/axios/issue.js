import { main } from '@system/axios/config';

export const getIssues = async () => {
  const issue = await main.get('/issue');
  return issue.data;
};

export const getIssue = async (id) => {
  const issue = await main.get(`/issue/${id}`);
  return issue.data;
};

export const createIssue = async (body) => {
  const { uid } = localStorage.getItem('user');
  const issue = await main.post('/issue', { ...body, uid });
  return issue.status;
};

export const patchIssue = async (id, body) => {
  const issue = await main.patch(`/issue/${id}`, body);
  return issue.status;
};

export const deleteIssue = async (id) => {
  const issue = await main.delete(`/issue/${id}`);
  return issue.status;
};

export const uploadImage = async (image) => {
  const fd = new FormData();
  fd.append('img', image);
  const imageUrl = await main.post(`/image/upload`, fd);
  return imageUrl.data.link;
};
