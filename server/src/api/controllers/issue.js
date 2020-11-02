import issueService from '@services/issue';

const getIssue = async (req, res) => {
  const iid = req.params.id;
  try {
    const issue = await issueService.getIssue(iid);
    return res.status(200).json(issue);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const getIssues = async (req, res) => {};
const createIssue = async (req, res) => {};
const updateIssue = async (req, res) => {};
const deleteIssue = async (req, res) => {};

export default { getIssue };
