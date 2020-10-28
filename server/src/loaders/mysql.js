import db from '../models';

export default async () => {
  try {
    await db.sequelize.sync({ force: false });
  } catch (error) {
    throw new Error(error);
  }
};
