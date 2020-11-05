import loginService from '@services/passport';
import githubService from '@services/github';
import passport from 'passport';

const localLogin = (req, res) => {
  loginService.passportLocal(req, res);
};

const github = (req, res) => {
  passport.authenticate('github', { scope: ['user: email'] })(req, res);
};

const githubCallback = (req, res) => {
  loginService.passportGithub(req, res);
};

const githubAppLogin = async (req, res) => {
  const { token } = req.body;
  const userToken = await githubService.githubLogin(token);
  return res.status(200).json(userToken);
};

export default { localLogin, github, githubCallback, githubAppLogin };
