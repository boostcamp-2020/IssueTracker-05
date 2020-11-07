import imageService from '@services/image';

const imageUpload = (req, res) => {
  return res.status(200).json({
    link: req.file.data.link,
  });
};

const profileUpload = async (req, res) => {
  const { link } = req.file.data;
  const { uid } = req.user;
  try {
    await imageService.updateProfile(link, uid);
    return res.status(200).json({ link });
  } catch (err) {
    return res.status(400).json({
      message: err,
    });
  }
};

export default { imageUpload, profileUpload };
