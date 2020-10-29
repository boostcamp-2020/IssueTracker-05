import bcrypt from 'bcrypt';

import { bcryptConfig } from '@config/bcrypt';

export const hashPw = (password) =>
  new Promise((resolve, reject) => {
    bcrypt.hash(password, bcryptConfig.saltRounds, (err, hash) => {
      return resolve(hash);
    });
  });

export const checkPw = (password, hash) =>
  new Promise((resolve, reject) => {
    bcrypt.compare(password, hash, (err, result) => {
      return resolve(result);
    });
  });
