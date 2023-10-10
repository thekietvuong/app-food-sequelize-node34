// import mysql from "mysql2";
// const connect = mysql.createConnection({
//     host: "localhost",
//     user: "root",
//     password: "1234",
//     port: "3307",
//     database: "db_youtube"
// })

import { Sequelize } from "sequelize";

const sequelize = new Sequelize(
    "db_app_food", //database
    "root",
    "1234",
    {
        host: "localhost",
        port: "3307",
        dialect: "mysql"
    }
);

export default sequelize;

try{
    await sequelize.authenticate();
    console.log("Okay");
}catch(err){
    console.log("thất bại");
}

//yarn sequelize-auto -h localhost -d db_app_food -u root -x 1234 -p 3307 --dialect mysql -o ./src/models -l esm