import db from '@models';

export default async (name) => {
  try {
    await db.label.destroy({ where: { name } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
