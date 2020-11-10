import db from '@models';

export default async (milestoneId, content) => {
  try {
    if (content.title === '') {
      throw new Error('마일스톤의 제목은 필수로 작성해주셔야 합니다.');
    }
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
