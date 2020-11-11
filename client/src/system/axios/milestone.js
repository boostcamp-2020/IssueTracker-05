import { main } from '@system/axios/config';

const getMilestones = async () => {
  const milestoneList = await main.get('/milestone');
  return milestoneList.data;
};

const getMilestone = async (mid) => {
  const milestone = await main.get(`/milestone/${mid}`);
  return milestone.data;
};

const createMilestone = async (body) => {
  const response = await main.post(`/milestone`, body);
  if (response.status === 200) {
    return true;
  }
  console.log(response.data);
  return false;
};

const updateMilestone = async (mid, body) => {
  const response = await main.patch(`/milestone/${mid}`, body);
  if (response.status === 200) {
    return true;
  }
  console.log(response.data);
  return false;
};

const deleteMilestone = async (mid) => {
  const response = await main.delete(`/milestone/${mid}`);
  if (response.status === 200) {
    return true;
  }
  console.log(response.data);
  return false;
};

export default {
  getMilestone,
  getMilestones,
  createMilestone,
  updateMilestone,
  deleteMilestone,
};
