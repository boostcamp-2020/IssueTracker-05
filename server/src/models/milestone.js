export default (sequelize, DataTypes) => {
  const milestone = sequelize.define(
    'milestone',
    {
      mid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
      },
      isOpen: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
      },
      title: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      dueDate: {
        type: DataTypes.DATE,
        allowNull: true,
      },
      content: {
        type: DataTypes.DATE,
        allowNull: true,
      },
    },
    {
      tableName: 'milestone',
      underscored: true,
    },
  );

  return milestone;
};
