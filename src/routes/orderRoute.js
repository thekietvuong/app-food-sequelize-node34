import express from 'express';
import {getOrder, getOrderById , addOrder} from "../controllers/orderController.js"

const orderRoute = express.Router();

//thêm order
orderRoute.post("/add_order", addOrder)
//lấy thông tin order theo order_id
orderRoute.get("/get-order/:order_id", getOrderById)
//lấy danh sách like theo user và food
orderRoute.get("/get-order", getOrder)
export default orderRoute;