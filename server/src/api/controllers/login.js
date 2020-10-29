import loginService from '@services/passport'
import passport from 'passport';

const localLogin = (req, res) => {
  loginService.passportLocal(req, res);
};

const github = (req, res) => {
  passport.authenticate('github', { scope: [ 'user: email' ]})(req, res);
}

const githubCallback = (req, res) => {
  res.status(200).send('성공!!');
}

export default { localLogin, github, githubCallback };
