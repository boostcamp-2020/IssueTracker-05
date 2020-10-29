import { Strategy } from 'passport-local';

import { checkPw } from '../../services/bcrypto';

const localConfig = {
  usernameField: 'user',
  passwordField: 'password',
  session: false,
};
