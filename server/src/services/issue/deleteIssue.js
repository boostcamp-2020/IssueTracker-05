import db from '@models';

export default async (iid) => {
  try {
    await db.issue.destroy({ where: { iid } });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
