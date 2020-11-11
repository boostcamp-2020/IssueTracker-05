import { main } from '@system/axios/config';

export const getMilestones = async () => {
  const milestoneList = await main.get('/milestone');
  return milestoneList.data;
};

export const getMilestone = async (mid) => {
  const milestone = await main.get(`/milestone/${mid}`);
  return milestone.data;
};

export const createMilestone = async (body) => {
  const response = await main.post(`/milestone`, body);
  if (response.status === 200) {
    return true;
  }
  console.log(response.data);
  return false;
};

export const updateMilestone = async (mid, body) => {
  const response = await main.patch(`/milestone/${mid}`, body);
  if (response.status === 200) {
    return true;
  }
  return false;
};

export const deleteMilestone = async (mid) => {
  try {
    const response = await main.delete(`/milestone/${mid}`);
    if (response.status === 200) {
      return true;
    }
  } catch (err) {
    console.log(err);
  }
  return false;
};
