import db from '@models';

const getMilestoneFromDB = async () => {
  try {
    const milestoneList = await db.milestone.findAll();
    return milestoneList;
  } catch (err) {
    throw new Error(err);
  }
};

const deleteMilestoneFromDB = async (milestoneId) => {
  try {
    await db.history.destroy({
      where: {
        mid: milestoneId,
      },
    });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};

const editMilestoneFromDB = async (milestoneId, content) => {
  try {
    let targetMilestone = await db.milestone.findByPk(milestoneId);
    targetMilestone = { ...targetMilestone, ...content };
    await targetMilestone.save();
    return true;
  } catch (err) {
    throw new Error(err);
  }
};

const addMilestoneToDB = async (content) => {
  let addMilestone;
  try {
    addMilestone = await db.milestone.create(content);
  } catch (err) {
    throw new Error(err);
  }
  return addMilestone;
};

export default {
  getMilestoneFromDB,
  deleteMilestoneFromDB,
  editMilestoneFromDB,
  addMilestoneToDB,
};
