import axios from 'axios';

const baseURL = 'http://group05issuetracker.duckdns.org:49203/api';

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
    Authorization: `bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInVzZXJJZCI6InRlc3RJZDEiLCJwYXNzd29yZCI6IiQyYiQxMiR6dlNFaHB6RVNNcExUNHhqeEZULm1lMVRwUDc4Rk4uU3NzTlJ0a2Vsa0ZYVll4OEptZTJ3NiIsIm5pY2tuYW1lIjoidGVzdE5pY2tuYW1lMSIsIk9BdXRoIjpmYWxzZSwicmVzb3VyY2VTZXJ2ZXIiOiJsb2NhbCIsImltYWdlIjpudWxsLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJpYXQiOjE2MDQ5MTQ3NjB9.THKsiNZ2CUPRbl7iiPbrJm3kK1EcAyQSwhfGXnixutM`,
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Cache: 'no-cache',
  },
  withCredentials: true,
});

// 레이블 get 해서 화면에 뿌려주기
// 로그인화면, 마일스톤 화면 제작(훅까지 다는거!)
