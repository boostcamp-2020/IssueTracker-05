import db from '@models';

const getMilestoneFromDB = async () => {
  try {
    const milestoneList = await db.milestone.findAll({
      include: [
        {
          model: db.issue,
          attributes: ['iid', 'title', 'isOpen'],
        },
      ],
    });
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
    if (content.isOpen === false) {
      content.closedAt = new Date();
    }
    const targetMilestone = await db.milestone.update(content, {
      where: { mid: milestoneId },
    });
    return targetMilestone;
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
