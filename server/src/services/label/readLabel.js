import db from '@models';

export default async (name) => {
  try {
    const label = await db.label.findOne({ where: { name } });
    return label;
  } catch (err) {
    throw new Error(err);
  }
};
