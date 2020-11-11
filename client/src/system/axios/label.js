import { main } from '@system/axios/config';

export const getLabels = async () => {
  const labels = await main.get('/label');
  return labels.data;
};

export const getLabel = async () => {
  const label = await main.get('/label/:name');
  return label.data;
};

export const createLabel = async (name, desc, color) => {
  const label = await main.post('/label', { name, desc, color });
  return label.status;
};

export const patchLabel = async (oldname, name, color, desc) => {
  console.log('hi');
  const label = await main.patch(`/label/${oldname}`, {
    desc,
    color,
    name,
  });
  return label.status;
};

export const deleteLabel = async (name) => {
  const label = await main.delete(`/label/${name}`);
  return label.status;
};
