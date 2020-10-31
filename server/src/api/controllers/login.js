import loginService from '@services/passport'
import passport from 'passport';

const localLogin = (req, res) => {
  loginService.passportLocal(req, res);
};

const github = (req, res) => {
  passport.authenticate('github', { scope: [ 'user: email' ]})(req, res);
}

const githubCallback = (req, res) => {
  loginService.passportGithub(req, res);
}

export default { localLogin, github, githubCallback };
