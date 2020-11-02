import jwt from 'jsonwebtoken';
import passport from 'passport';
import passportConfig from '@config/passport';

const passportLocal = (req, res) => {
  passport.authenticate('local', { session: false }, (err, user, message) => {
    if (err || !user) {
      return res.status(400).json(message);
    }
    return req.login(user, { session: false }, (error) => {
      if (error) {
        res.send(error);
      }
      const token = jwt.sign(user.toJSON(), passportConfig.secretOrKey);
      return res.json({ user, token });
    });
  })(req, res);
};

const passportGithub = (req, res) => {
  passport.authenticate('github', { session: false }, (err, user) => {
    const token = jwt.sign(user[0].toJSON(), passportConfig.secretOrKey)
    return res.status(200).json({ user, token });
  })(req, res)
}

export default { passportLocal, passportGithub };
