/* eslint-disable no-unused-vars */
import bcrypt from 'bcrypt';

// eslint-disable-next-line import/no-unresolved
import bcryptConfig from '@config/bcrypt';

const hashPw = (password) =>
  new Promise((resolve, reject) => {
    bcrypt.hash(password, bcryptConfig.saltRounds, (err, hash) => {
      return resolve(hash);
    });
  });

const checkPw = (password, hash) =>
  new Promise((resolve, reject) => {
    bcrypt.compare(password, hash, (err, result) => {
      return resolve(result);
    });
  });

export default { hashPw, checkPw };
