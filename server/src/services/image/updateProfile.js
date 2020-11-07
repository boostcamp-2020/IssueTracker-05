import db from '@models';

export default async (link, uid) => {
  try {
    await db.user.update(
      { image: link },
      {
        where: { uid },
      },
    );
    return true;
  } catch (err) {
    throw new Error(err);
  }
};
