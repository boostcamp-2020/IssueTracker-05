import db from '@models';

export default async (beforename, name, desc, color) => {
  try {
    const label = await db.label.findByPk(name);
    if (label) {
      throw new Error('이미 존재하는 이름입니다.');
    }
    await db.label.update(
      { name, desc, color },
      { where: { name: beforename } },
    );
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
