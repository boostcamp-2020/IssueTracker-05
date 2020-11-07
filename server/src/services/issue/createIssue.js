import db from '@models';

export default async (issueContent, uid) => {
  try {
    const issue = await db.issue.create({
      ...issueContent,
      uid,
    });
    if (issueContent.labels) {
      const labels = await db.label.findAll({
        where: {
          [db.Sequelize.Op.or]: issueContent.labels,
        },
      });
      await issue.addLabels(labels, { through: { selfGranted: true } });
    }
    if (issueContent.assignees) {
      const assignees = await db.user.findAll({
        where: {
          [db.Sequelize.Op.or]: issueContent.assignees,
        },
      });
      await issue.addAssignees(assignees, { through: { selfGranted: true } });
    }
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};
