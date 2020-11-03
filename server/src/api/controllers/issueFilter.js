import issueFilterService from '@services/issueFilter';

const searchIssue = async (req, res) => {
  const issues = await issueFilterService.issueFilter(req.body);
  return res.status(200).json(issues);
};

export default { searchIssue };
