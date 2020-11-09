import db from '@models';

export default async (name, desc, color) => {
  try {
    const label = await db.label.findByPk(name);
    if (label) {
      throw new Error('이미 존재하는 이름입니다.');
    }
    await db.label.create({
      name,
      desc,
      color,
    });
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
