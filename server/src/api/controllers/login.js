// import loginService from '@services/passport';
import githubService from '@services/auth/github';
import appleService from '@services/auth/apple';

const localLogin = (req, res) => {
  return res.status(200).json(req.user);
};

const githubCallback = (req, res) => {
  return res.status(200).json(req.user);
};

const githubAppLogin = async (req, res) => {
  const { token } = req.body;
  const userToken = await githubService.githubLogin(token);
  return res.status(200).json(userToken);
};

const appleAppLogin = async (req, res) => {
  const { token } = req.body;
  const userToken = await appleService.appleLogin(token);
  return res.status(200).json(userToken);
};

export default { localLogin, githubCallback, githubAppLogin, appleAppLogin };
