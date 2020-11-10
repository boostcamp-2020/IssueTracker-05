import milestoneService from '@services/milestone';

const getMilestone = async (req, res) => {
  try {
    const milestoneList = await milestoneService.readMilestones();
    return res.status(200).json(milestoneList);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const deleteMilestone = async (req, res) => {
  try {
    await milestoneService.deleteMilestone(req.params.id);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const editMilestone = async (req, res) => {
  const { body } = req;
  try {
    await milestoneService.updateMilestone(req.params.id, body);
    return res.status(200).end();
  } catch (err) {
    res.status(400).json({
      message: err.message,
    });
  }
};

const addMilestone = async (req, res) => {
  const { body } = req;
  try {
    const milestone = await milestoneService.createMilestone(body);
    return res.status(200).json(milestone);
  } catch (err) {
    res.status(400).json({
      message: err.message,
    });
  }
};

export default { getMilestone, deleteMilestone, editMilestone, addMilestone };
