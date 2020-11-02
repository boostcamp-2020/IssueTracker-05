import signupService from '@services/signup';

const checkId = async (req, res, next) => {
  const { userId } = req.body; // true 아이디 없음, false 이미 아이디가 존재함
  const isDuplicated = await signupService.isDuplicated(userId);
  if (!isDuplicated) {
    return res.status(400).json({
      message: '아이디가 이미 존재합니다.',
    });
  }
  next();
};

const isValid = (req, res, next) => {
  const { userId, password } = req.body;

  if (userId.length < 6) {
    return res
      .status(400)
      .json({ message: '아이디는 6자 이상 적어주셔야 합니다.' });
  }
  if (userId.length > 16) {
    return res
      .status(400)
      .json({ message: '아이디는 16자 이하로 적어주셔야 합니다.' });
  }

  if (password.length < 6) {
    return res
      .status(400)
      .json({ message: '비밀번호는 6자 이상 적어주셔야 합니다.' });
  }
  if (password.length > 12) {
    return res
      .status(400)
      .json({ message: '비밀번호는 12자 이하로 적어주셔야 합니다.' });
  }

  const idPattern = /[a-zA-Z0-9]/;
  const digitPattern = /[0-9]/;
  const alphabetPattern = /[a-zA-Z]/;
  const speicalSymbolPattern = /[~!@#$%^&*()_+|<>?:{}]/;

  if (!idPattern.test(userId)) {
    return res
      .status(400)
      .json({ message: '아이디는 영문과 숫자로만 적어주셔야 합니다.' });
  }

  if (
    !digitPattern.test(password) ||
    !alphabetPattern.test(password) ||
    !speicalSymbolPattern.test(password)
  ) {
    return res.status(400).json({
      message: '비밀번호는 영문자, 숫자, 특수문자로 구성되어야 합니다.',
    });
  }

  next();
};

export default { isValid, checkId };
