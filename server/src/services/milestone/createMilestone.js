import db from '@models';

export default async (content) => {
  try {
    const addMilestone = await db.milestone.create(content);
    return addMilestone;
  } catch (err) {
    throw new Error(err);
  }
};
