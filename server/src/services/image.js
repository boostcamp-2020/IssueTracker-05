import db from '@models';

const profileUpload = async (link, uid) => {
  try {
    await db.user.update(
      { image: link },
      {
        where: { uid },
      },
    );
    return true;
  } catch (err) {
    return false;
  }
};

export default { profileUpload };
