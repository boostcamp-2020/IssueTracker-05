import express from './express';
import mysql from './mysql';

export default async (app) => {
  await mysql();
  console.log('🎉 DB Connect! 🎉');

  await express(app);
  console.log('🍟 Express Connect! 🍟');
};
