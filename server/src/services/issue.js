import db from '@models';

const getIssue = async (iid) => {
  try {
    const issue = await db.issue.findOne({ where: { iid } });
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};

export default { getIssue };
