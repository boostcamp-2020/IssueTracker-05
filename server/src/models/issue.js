export default (sequelize, DataTypes) => {
  const issue = sequelize.define(
    'issue',
    {
      iid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        primaryKey: true,
        autoIncrement: true,
      },
      isOpen: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
      },
      label: {
        type: DataTypes.STRING,
        allowNull: true,
      },
      title: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      content: {
        type: DataTypes.STRING,
        allowNull: true,
      },
    },
    {
      tableName: 'issue',
      underscored: true,
    },
  );

  issue.associate = (models) => {
    issue.belongsTo(models.milestone, {
      foreignKey: {
        name: 'mid',
        allowNull: true,
      },
    });

    issue.hasMany(models.comment, {
      foreignKey: {
        name: 'iid',
        allowNull: false,
      },
    });
  };

  return issue;
};