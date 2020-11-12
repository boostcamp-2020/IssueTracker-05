import jwt from 'jsonwebtoken';
import passport from 'passport';

import passportConfig from '@config/passport';

const githubCallback = (req, res) => {
  passport.authenticate('github', { session: false }, (err, user) => {
    if (err || !user) {
      return res.status(400).redirect('/login');
    }
    req.login(user, { session: false }, (error) => {
      if (error) {
        res.send(error);
      }
      const token = jwt.sign(user.toJSON(), passportConfig.secretOrKey);
      res.cookie('token', token, {
        maxAge: 1000 * 60 * 60,
        signed: true,
      });
      res.cookie('user', user, {
        maxAge: 1000 * 60 * 60,
        signed: true,
      });
      return res.status(200).redirect('/login/github');
    });
  })(req, res);
};

export default { githubCallback };
