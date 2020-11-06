import imageService from '@services/image';

const imageUpload = (req, res) => {
  return res.status(200).json({
    link: req.file.data.link,
  });
};

const profileUpload = async (req, res) => {
  const { link } = req.file.data;
  const { uid } = req.user;
  const success = await imageService.profileUpload(link, uid);
  if (!success) {
    return res.status(400).end();
  }
  return res.status(200).json({
    link,
  });
};

export default { imageUpload, profileUpload };
