const imageUpload = async (req, res) => {
  return res.status(200).json({
    link: req.file.data.link,
  });
};

export default { imageUpload };
