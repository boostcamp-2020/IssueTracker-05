export default (sequelize, DataTypes) => {
  const milestone = sequelize.define(
    'milestone',
    {
      mid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
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
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      tableName: 'milestone',
      underscored: true,
    },
  );

  milestone.associate = (models) => {
    milestone.hasMany(models.issue, {
      foreignKey: {
        name: 'mid',
        allowNull: true,
      },
    });
  };

  return milestone;
};
