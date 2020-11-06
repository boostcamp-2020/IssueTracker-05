import userService from '@services/user';

const getUsers = async (req, res) => {
  try {
    const users = await userService.getUsers();
    return res.status(200).json(users);
  } catch (err) {
    return res.status(400).json({
      message: err.message,
    });
  }
};

export default { getUsers };
