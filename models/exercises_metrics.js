module.exports = function(sequelize, DataTypes) {
  return sequelize.define('exercises_metrics', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    vote_count: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 0
    },
    avg_vote_score: {
      type: DataTypes.DECIMAL,
      allowNull: false,
      defaultValue: 0.0
    },
    tags_ids: {
      type: DataTypes.ARRAY(DataTypes.INTEGER),
      allowNull: false,
      defaultValue: []
    },
    exercise_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'exercises',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'exercises_metrics',
    schema: 'public',
    timestamps: false,
    underscored: true,
    indexes: [
      {
        name: "exercises_metrics_pkey",
        unique: true,
        fields: [
          { name: "id" },
        ]
      },
    ]
  });
};
