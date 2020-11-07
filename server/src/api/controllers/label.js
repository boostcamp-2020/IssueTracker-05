import labelService from '@services/label';

const createLabel = async (req, res) => {
  const { name, desc, color } = req.body;
  try {
    await labelService.createLabel(name, desc, color);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const getLabels = async (req, res) => {
  try {
    const labels = await labelService.readLabels();
    return res.status(200).json(labels);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const getLabel = async (req, res) => {
  const { name } = req.params;
  try {
    const label = await labelService.readLabel(name);
    return res.status(200).json(label);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const patchLabel = async (req, res) => {
  const beforename = req.params.name;
  const { name, desc, color } = req.body;
  try {
    await labelService.updateLabel(beforename, name, desc, color);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

const deleteLabel = async (req, res) => {
  const { name } = req.params;
  try {
    await labelService.deleteLabel(name);
    return res.status(200).end();
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default { createLabel, getLabels, getLabel, patchLabel, deleteLabel };
