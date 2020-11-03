import db from '@models';

const isOpenAndYourIssues = async (data) => {
  const { uid, isOpen } = data;
  const where = { uid, isOpen };
  Object.keys(where).forEach((key) =>
    where[key] === undefined ? delete where[key] : {},
  );
  const issues = await db.issue.findAll({
    attributes: ['iid'],
    where,
  });
  return issues.map((issue) => issue.iid);
};

const assigneeIssues = async (uid) => {
  const issues = await db.issue.findAll({
    attributes: ['iid'],

  })
}

const mentionIssues = async (uid) => {

}