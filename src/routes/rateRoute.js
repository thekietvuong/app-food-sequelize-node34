import express from 'express';
import {getRate,addRate,getRateById} from "../controllers/rateController.js"

const rateRoute = express.Router();

//thêm đánh giá
rateRoute.post("/add_rate", addRate)
//lấy thông tin like theo like_id
rateRoute.get("/get-rate/:rate_res_id", getRateById)
//lấy danh sách đánh theo nhà hàng và user
rateRoute.get("/get-rate", getRate)
export default rateRoute;