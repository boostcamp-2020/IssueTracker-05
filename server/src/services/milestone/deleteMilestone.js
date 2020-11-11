import db from '@models';

export default async (milestoneId) => {
  try {
    await db.milestone.destroy({
      where: {
        mid: milestoneId,
      },
    });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
