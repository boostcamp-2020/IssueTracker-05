import db from '@models';

export default async () => {
  try {
    const milestoneList = await db.milestone.findAll({
      include: [
        {
          model: db.issue,
          attributes: ['iid', 'title', 'isOpen'],
        },
      ],
    });
    return milestoneList;
  } catch (err) {
    throw new Error(err);
  }
};
