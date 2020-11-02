import milestoneService from '@services/milestone';

const getMilestone = async (req, res) => {
  try {
    const milestoneList = await milestoneService.getMilestoneFromDB();
    return res.status(200).json(milestoneList);
  } catch (err) {
    return res.status(400).json({
      message: err,
    });
  }
};

const deleteMilestone = async (req, res) => {
  try {
    await milestoneService.deleteMilestonFromDB(req.params.id);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err,
    });
  }
};

const editMilestone = async (req, res) => {
  const { body } = req;
  try {
    await milestoneService.editMilestoneFromDB(req.params.id, body);
  } catch (err) {
    res.status(400).json({
      message: err,
    });
  }
  return res.status(200).end();
};

const addMilestone = async (req, res) => {
  const { body } = req;
  let milestone;
  try {
    milestone = await milestoneService.addMilestoneToDB(body);
  } catch (err) {
    res.status(400).json({
      message: err,
    });
  }
  return res.status(200).json(milestone);
};

export default { getMilestone, deleteMilestone, editMilestone, addMilestone };
