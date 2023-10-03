const express = require("express");
const http = require("http");
const db = require("./db.js");
const { initModels } = require("./models/init-models.js");
const models = initModels(db);

const PORT = 3002;
const app = express();

app.use("/", async (req, res) => {
  const status = await db.authenticate();
  res.send(status);
});

const server = http.createServer(app);

server.listen(PORT, async () => {
  console.log(`Server http://localhost:${PORT}`);
  try {
    await db.authenticate();
    const [updatedRowsCount] = await models.exercises_metrics.update(
      { tags_ids: [] },
      {
        where: {
          exercise_id: 4,
        },
      }
    );

    if (updatedRowsCount === 1) {
      console.log("Tags_ids for ExerciseMetrics updated successfully.");
    } else {
      console.log("ExerciseMetrics with not found.");
    }
  } catch (error) {
    console.log(error);
  }
});
