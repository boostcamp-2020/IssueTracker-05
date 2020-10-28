export default (sequelize, DataTypes) => {
  const user = sequelize.define(
    'user',
    {
      id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      uid: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      password: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      nickname: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      OAuth: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
      },
      resourceServer: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    {
      tableName: 'user',
      underscored: true,
    },
  );

  return user;
};
