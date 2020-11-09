import { useEffect } from 'react';
import axios from 'axios';
import { main } from '../../config/axios';

export const getLabels = () => {
  useEffect(() => {
    main.get('/api/label').then(({ data }) => {
      return data;
    });
  }, []);
};

export const createLabel = async (name, desc, color) => {
  console.log('hi');
  const response = await fetch(
    'http://group05issuetracker.duckdns.org:49203/api/label',
    {
      credentials: 'include',
      'Access-Control-Allow-Origin': '*',
      headers: {
        Authorization: `bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInVzZXJJZCI6InRlc3RJZDEiLCJwYXNzd29yZCI6IiQyYiQxMiR6dlNFaHB6RVNNcExUNHhqeEZULm1lMVRwUDc4Rk4uU3NzTlJ0a2Vsa0ZYVll4OEptZTJ3NiIsIm5pY2tuYW1lIjoidGVzdE5pY2tuYW1lMSIsIk9BdXRoIjpmYWxzZSwicmVzb3VyY2VTZXJ2ZXIiOiJsb2NhbCIsImltYWdlIjpudWxsLCJjcmVhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJ1cGRhdGVkQXQiOiIyMDIwLTExLTA1VDEzOjUyOjAxLjAwMFoiLCJpYXQiOjE2MDQ5MTQ3NjB9.THKsiNZ2CUPRbl7iiPbrJm3kK1EcAyQSwhfGXnixutM`,
        Accept: 'application/json',
        'Content-Type': 'application/json',
        Cache: 'no-cache',
      },
    },
  );
  return response.data;
};

// export const getHistory = async () => {
//   try {
//     const historyList = await main.get('/history');
//     return historyList.data;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const addHistory = async (body) => {
//   try {
//     await main.post('/history', {
//       data: { body },
//     });
//     return true;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const editHistory = async (id, body) => {
//   try {
//     await main.put(`/history/${id}`, {
//       data: body,
//     });
//     return true;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const deleteHistory = async (id) => {
//   try {
//     await main.delete(`/history/${id}`);
//     return true;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const getPaymentList = async () => {
//   try {
//     const paymentList = await main.get('/payment');
//     return paymentList.data;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const getCategoryList = async () => {
//   try {
//     const categoryList = await main.get('/category');
//     return categoryList.data;
//   } catch (err) {
//     throw new Error(err);
//   }
// };

// export const addPayment = async (body) => {
//   try {
//     await main.delete(`/payment`, {
//       data: body,
//     });
//     return true;
//   } catch (err) {
//     throw new Error(err);
//   }
// };
