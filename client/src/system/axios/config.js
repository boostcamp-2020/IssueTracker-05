// import dotenv from 'dotenv';
import axios from 'axios';

// const envFound = dotenv.config();

// if (envFound.error) {
//   throw new Error(" Couldn't find .env file ");
// }

const baseURL = '/api';

export const sign = axios.create({
  baseURL,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Cache: 'no-cache',
  },
  withCredentials: true,
});

export const main = axios.create({
  baseURL,
  headers: {
    Authorization: `bearer ${localStorage.getItem('token')}`,
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Cache: 'no-cache',
  },
  withCredentials: true,
});

// 레이블 get 해서 화면에 뿌려주기
// 로그인화면, 마일스톤 화면 제작(훅까지 다는거!)
