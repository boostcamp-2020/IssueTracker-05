export default (sequelize, DataTypes) => {
  const comment = sequelize.define(
    'comment',
    {
      cid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      content: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    {
      tableName: 'comment',
      underscored: true,
    },
  );

  return comment;
};
