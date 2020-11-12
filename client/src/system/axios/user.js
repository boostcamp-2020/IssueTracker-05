import { main } from '@system/axios/config';

const getUsers = async () => {
  const userList = await main.get(`/user`);
  return userList.data;
};

const updateProfile = async (image) => {
  const fd = new FormData();
  fd.append('img', image);
  const imageUrl = await main.post(`/image/profile`, fd);
  return imageUrl.data.link;
};

export { getUsers, updateProfile };
