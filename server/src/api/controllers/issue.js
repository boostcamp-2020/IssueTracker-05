import issueService from '@services/issue';

const getTargetIssue = async (req, res) => {
  const iid = req.params.id;
  try {
    const issue = await issueService.getTargetIssue(iid);
    return res.status(200).json(issue);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const getIssues = async (req, res) => {
  const { page } = req.query;
  try {
    const issues = await issueService.getIssues(page);
    return res.status(200).json(issues);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const createIssue = async (req, res) => {
  const { body } = req;
  const { uid } = req.user;
  try {
    const issue = await issueService.createIssue(body, uid);
    return res.status(200).json(issue);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const updateIssue = async (req, res) => {
  const iid = req.params.id;
  const { body } = req;
  try {
    const issue = await issueService.updateIssue(body, iid);
    return res.status(200).json(issue);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const deleteIssue = async (req, res) => {
  const iid = req.params.id;
  try {
    await issueService.deleteIssue(iid);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default {
  getIssues,
  getTargetIssue,
  createIssue,
  updateIssue,
  deleteIssue,
};
