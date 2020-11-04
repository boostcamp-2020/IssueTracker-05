import signupService from '@services/signup';

const checkId = (req, res) => {
  return res.status(200);
};

const signup = async (req, res) => {
  const { userId, password, nickname } = req.body;
  try {
    const user = await signupService.createUser(userId, password, nickname);
    return res.status(200).json(user);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default { checkId, signup };
