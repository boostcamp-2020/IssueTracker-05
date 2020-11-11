import db from '@models';

export default async (query, uid) => {
  try {
    if (!query.page) {
      // app의 경우 client rendering
      const issues = await db.issue.findAll({
        attributes: ['iid', 'isOpen', 'title', 'createdAt', 'closedAt', 'content'],
        include: [
          {
            model: db.user,
            attributes: ['uid', 'userId', 'nickname', 'image'],
          },
          {
            model: db.comment,
            attributes: ['cid', 'uid'],
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
            attributes: ['name', 'color'],
          },
          {
            model: db.milestone,
            attributes: ['mid', 'title', 'updatedAt'],
            include: [
              {
                model: db.issue,
                attributes: ['isOpen'],
              },
            ],
          },
        ],
      });
      return issues;
    }
    const where = {
      isOpen: query.isOpen ? query.isOpen === 'true' : undefined,
      uid: query.isYours ? uid : query.author,
      mid: query.mid ? query.mid : undefined,
      '$assignees.id$': query.assignees ? query.assignees : undefined,
      '$labels.name$': query.labels ? query.labels : undefined,
      '$comments.uid$': query.isComment ? uid : undefined,
    };
    Object.keys(where).forEach((key) =>
      where[key] === undefined ? delete where[key] : {},
    );
    const issues = await db.issue.findAll({
      include: ['milestone', 'comments', 'assignees', 'labels'],
      where,
    });
    return issues;
  } catch (err) {
    throw new Error(err);
  }
};
