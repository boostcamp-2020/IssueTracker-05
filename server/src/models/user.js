export default (sequelize, DataTypes) => {
  const user = sequelize.define(
    'user',
    {
      uid: {
        type: DataTypes.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      userId: {
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

  user.associate = (models) => {
    user.hasMany(models.comment, {
      foreignKey: {
        name: 'uid',
        allowNull: false,
      },
    });

    user.hasMany(models.issue, {
      foreignKey: {
        name: 'uid',
        allowNull: false,
      },
    });

    user.belongsToMany(models.issue, {
      through: 'issue_user',
    });
  };

  return user;
};
