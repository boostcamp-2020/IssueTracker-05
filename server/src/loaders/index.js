import express from '@loaders/express';
import mysql from '@loaders/mysql';

export default async (app) => {
  await mysql();
  console.log('🎉 DB Connect! 🎉');

  await express(app);
  console.log('🍟 Express Connect! 🍟');
};
