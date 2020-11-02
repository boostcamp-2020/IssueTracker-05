import db from '@models';

const createLabel = async (name, desc, color) => {
  try {
    await db.label.create({
      name,
      desc,
      color,
    });
  } catch (err) {
    throw new Error(err);
  }
};

const getLabels = async () => {
  try {
    const labels = db.label.findAll();
    return labels;
  } catch (err) {
    throw new Error(err);
  }
};

const getLabel = async (name) => {
  try {
    const label = await db.label.findOne({ where: { name } });
    return label;
  } catch (err) {
    throw new Error(err);
  }
};

const patchLabel = async (name, desc, color) => {
  try {
    await db.label.update({ name, desc, color }, { where: { name } });
  } catch (err) {
    throw new Error(err);
  }
};

const deleteLabel = async (name) => {
  try {
    await db.label.destroy({ where: { name } });
  } catch (err) {
    throw new Error(err);
  }
};

export default { createLabel, getLabels, getLabel, patchLabel, deleteLabel };
