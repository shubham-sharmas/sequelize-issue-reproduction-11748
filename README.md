# Reproduction of sequelize issue [#11748](https://github.com/sequelize/sequelize/issues/11748)

Environment

- Sequelize version: 5.21.2
- Node.js version: v10.16.0
- Operating System: Ubuntu 20.04.6 LTS

## Setup & Execution

1. Clone the repository and navigate to the root directory.
2. Check your Node.js version using the command: `node --version`. Make sure it's at least 10.16.0, or update your Node.js version using `nvm`.
3. Run either of the following commands: : `npm i` or `npm ci`.
4. Create database named `_11748` & import file `db_dump.sql`, You can use one of the following commands:
   1. To import from the command line: `psql -U username dbname < dbexport.sql`.
   2. Or, log in to psql and run: `\i <full_path/db_dump.sql>`.
   3. Alternatively, use your GUI client to import the database.
5. Add the database details to the db.js file. Provide the following information:
   1. `username`
   2. `password`
6. Now, run the command: `node index.js`
7. If everything is working correctly, open the `index.js` and set the `exercise_id`(Line Number 26) for which you want to update the empty array in the database.
8. Run the server again using: `node index.js`
9. You should see the message: `Tags_ids for ExerciseMetrics updated successfully.`.
