import db from '@models';

const openIssue = async () => {
  const issues = await db.issue.findAll({
    where: {
      isOpen: true,
    },
  });
  return issues;
};

const labelFilter = async (labels) => {
  if (!labels) {
    return [];
  }
  const issues = await db.label.findAll({
    where: {
      [db.Sequelize.Op.or]: labels,
    },
    include: [
      {
        model: db.issue,
        attributes: ['iid'],
      },
    ],
  });
  const issueSet = new Set();
  issues.forEach((label) =>
    label.issues.forEach((iid) => issueSet.add(iid.iid)),
  );
  const issueList = Array.from(issueSet);
  return issueList;
};

const assigneeFilter = async (assignees) => {
  if (!assignees) {
    return [];
  }
  const issues = await db.user.findAll({
    where: {
      [db.Sequelize.Op.or]: assignees,
    },
    include: [
      {
        model: db.issue,
        attributes: ['iid'],
      },
    ],
  });
  const issueSet = new Set();
  issues.forEach((assignee) =>
    assignee.issues.forEach((iid) => issueSet.add(iid.iid)),
  );
  const issueList = Array.from(issueSet);
  return issueList;
};

const authorMilestoneFilter = async (data) => {
  const { uid, mid } = data;
  const where = { uid, mid };
  Object.keys(where).forEach((key) =>
    where[key] === undefined ? delete where[key] : {},
  );
  const issues = await db.issue.findAll({
    attributes: ['iid'],
    where,
  });
  return issues.map((iid) => iid.iid);
};

const issueFilter = async (body) => {
  const authorMilestoneFunction = authorMilestoneFilter(body);
  const labelFunction = labelFilter(body.labels);
  const assigneeFunction = assigneeFilter(body.assignees);
  const [
    authorMilestoneIssues,
    labelIssues,
    assigneeIssues,
  ] = await Promise.all([
    authorMilestoneFunction,
    labelFunction,
    assigneeFunction,
  ]);
  const issueIds = new Set([
    ...authorMilestoneIssues,
    ...labelIssues,
    ...assigneeIssues,
  ]);

  const issueList = Array.from(issueIds);
  const issues = db.issue.findAll({
    where: {
      iid: {
        [db.Sequelize.Op.or]: issueList,
      },
    },
    include: [db.label, db.user],
  });
  return issues;
};

export default { openIssue, issueFilter };
