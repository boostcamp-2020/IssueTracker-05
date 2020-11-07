import db from '@models';

export default async (iid) => {
  try {
    const issue = await db.issue.findOne({
      where: { iid },
      attributes: [
        'iid',
        'isOpen',
        'title',
        'content',
        'createdAt',
        'closedAt',
      ],
      include: [
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname', 'image'],
        },
        {
          model: db.comment,
          attributes: ['cid', 'content', 'createdAt'],
          include: [
            {
              model: db.user,
              attributes: ['uid', 'userId', 'nickname', 'image'],
            },
          ],
        },
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname', 'image'],
          as: 'assignees',
          through: { attributes: [] },
        },
        {
          model: db.label,
          through: { attributes: [] },
          as: 'labels',
          attributes: ['name', 'color', 'desc'],
        },
        {
          model: db.milestone,
          attributes: ['mid', 'title'],
          include: [
            {
              model: db.issue,
              attributes: ['isOpen'],
            },
          ],
        },
      ],
    });
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};
