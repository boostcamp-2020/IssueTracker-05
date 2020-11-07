import db from '@models';

export default async () => {
  try {
    const labels = db.label.findAll();
    return labels;
  } catch (err) {
    throw new Error(err);
  }
};
