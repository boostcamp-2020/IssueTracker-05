import db from '@models';

export default async (milestoneId, content) => {
  try {
    if (content.isOpen === false) {
      content.closedAt = new Date();
    }
    const targetMilestone = await db.milestone.update(content, {
      where: { mid: milestoneId },
    });
    return targetMilestone;
  } catch (err) {
    throw new Error(err);
  }
};
