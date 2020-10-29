import passport from 'passport';

export default (app) => {
  app.use(passport.initialize());
}
