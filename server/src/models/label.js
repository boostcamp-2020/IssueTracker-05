export default (sequelize, DataTypes) => {
  const label = sequelize.define(
    'label',
    {
      name: {
        type: DataTypes.STRING,
        allowNull: false,
        primaryKey: true,
      },
      color: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      desc: {
        type: DataTypes.STRING,
        allowNull: false,
      },
    },
    {
      tableName: 'label',
      underscored: true,
    },
  );

  return label;
};
