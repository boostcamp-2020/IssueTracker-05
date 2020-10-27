import express from './express';

export default async (app) => {
  await express(app);
  console.log('🍟 Express Connect! 🍟');
};
