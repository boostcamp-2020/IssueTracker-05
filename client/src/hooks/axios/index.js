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

export const createLabel = (name, desc, color) => {
  console.log(name, desc, color);
  main
    .post('http://group05issuetracker.duckdns.org:49203/api/label', {
      name,
      desc,
      color,
    })
    .then((res) => console.log(res.data));
};

axios API 제작 및 구성설정 (오전)
레이블 get 해서 화면에 뿌려주기
로그인화면, 마일스톤 화면 제작(훅까지 다는거!)

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
