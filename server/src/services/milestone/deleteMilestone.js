import db from '@models';

export default async (milestoneId) => {
  try {
    await db.history.destroy({
      where: {
        mid: milestoneId,
      },
    });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
