
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('exercises', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    exercise_name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    exercise_description: {
      type: DataTypes.TEXT,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'exercises',
    schema: 'public',
    timestamps: true,
    underscored: true,
    indexes: [
      {
        name: "exercises_pkey",
        unique: true,
        fields: [
          { name: "id" },
        ]
      },
    ]
  });
};
