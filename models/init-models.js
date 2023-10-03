var DataTypes = require("sequelize").DataTypes;
var _exercises = require("./exercises");
var _exercises_metrics = require("./exercises_metrics");

function initModels(sequelize) {
  var exercises = _exercises(sequelize, DataTypes);
  var exercises_metrics = _exercises_metrics(sequelize, DataTypes);

  exercises_metrics.belongsTo(exercises, {
    as: "exercise",
    foreignKey: "exercise_id",
  });
  exercises.hasMany(exercises_metrics, {
    as: "exercises_metrics",
    foreignKey: "exercise_id",
  });

  return {
    exercises,
    exercises_metrics,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
