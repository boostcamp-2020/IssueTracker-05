import loginService from '@services/passport'

const localLogin = (req, res) => {
  loginService.passportLocal(req, res);
};

export default { localLogin };
