import express from 'express';
import {getLike, getLikeById , addLike, unLike} from "../controllers/likeController.js"

const likeRoute = express.Router();

//Like
likeRoute.post("/add_like", addLike)
//Unlike
likeRoute.delete("/un_like/:like_res_id", unLike)
//lấy thông tin like theo like_id
likeRoute.get("/get-like/:like_res_id", getLikeById)
//lấy danh sách like theo nhà hàng và user
likeRoute.get("/get-like", getLike)
export default likeRoute;