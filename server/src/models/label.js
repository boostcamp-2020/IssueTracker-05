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
        allowNull: true,
      },
    },
    {
      tableName: 'label',
      underscored: true,
    },
  );

  label.associate = (models) => {
    label.belongsToMany(models.issue, {
      through: 'issue_label',
    });
  };

  return label;
};
