import axios from 'axios';

const baseURL = process.env.URL;

export const sign = axios.create({
  baseURL,
});

export const main = axios.create({
  headers: {
    Authorization: `bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInVzZXJJZCI6InRlc3RJZDEiLCJwYXNzd29yZCI6IiQyYiQxMiR6dlNFaHB6RVNNcExUNHhqeEZULm1lMVRwUDc4Rk4uU3NzTlJ0a2Vsa0ZYVll4OEptZTJ3NiIsIm5pY2tuYW1lIjoidGVzdE5pY2tuYW1lMSIsIk9BdXRoIjpmYWxzZSwicmVzb3VyY2VTZXJ2ZXIiOiJsb2NhbCIsImltYWdlIjpudWxsLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJpYXQiOjE2MDQ5MTQ3NjB9.THKsiNZ2CUPRbl7iiPbrJm3kK1EcAyQSwhfGXnixutM`,
    Accept: 'application/json',
    'Content-Type': 'application/json',
    Cache: 'no-cache',
  },
  withCredentials: true,
});
