import db from '@models';

export default async (content) => {
  try {
    if (content.title === '') {
      throw new Error('마일스톤의 제목은 필수로 작성해주셔야 합니다.');
    }
    const addMilestone = await db.milestone.create(content);
    return addMilestone;
  } catch (err) {
    throw new Error(err);
  }
};
