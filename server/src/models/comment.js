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
        type: DataTypes.TEXT,
        allowNull: false,
      },
    },
    {
      tableName: 'comment',
      underscored: true,
    },
  );

  comment.associate = (models) => {
    comment.belongsTo(models.user, {
      foreignKey: {
        name: 'uid',
        allowNull: false,
      },
    });

    comment.belongsTo(models.issue, {
      foreignKey: {
        name: 'iid',
        allowNull: false,
      },
    });
  };

  return comment;
};
