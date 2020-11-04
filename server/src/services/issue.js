import db from '@models';

const getTargetIssue = async (iid) => {
  try {
    const issue = await db.issue.findOne({ 
      where: { iid },
      include: db.comment,
    });
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};

const getIssues = async (page) => {
  try {
    if (!page) {
      const issues = await db.issue.findAll({
        include: [db.label, db.user],
      });
      return issues;
    }
    const offset = page > 1 ? 10 * (page - 1) : 0;
    const issues = await db.issue.findAll({
      offset,
      limit: 10,
    });
    return issues;
  } catch (err) {
    throw new Error(err);
  }
};

const createIssue = async (issueContent, uid) => {
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
      await issue.addUsers(assignees, { through: { selfGranted: true } });
    }
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};

const deleteIssue = async (iid) => {
  try {
    await db.issue.destroy({ where: { iid } });
  } catch (err) {
    throw new Error(err);
  }
};

export default {
  getTargetIssue,
  getIssues,
  createIssue,
  deleteIssue,
};
