import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

const getOrder = async(req, res) => {
    let data = await model.orders.findAll({
        include: ["user", "food"]
    }); 
    res.send(data);
}

const getOrderById = async (req, res) => {
    const { order_id } = req.params;
  
    let data = await model.orders.findAll({
      where: {
        order_id,
      },
      include: ["user", "food"],
    });
  
    if (data) {
      res.send(data);
    } else {
      res.sendStatus(404);
    }
  };

const addOrder = async (req, res) => {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;
  
    try {
      const rate = await model.orders.create({
        user_id,
        food_id,
        amount,
        code,
        arr_sub_id
      });
  
      res.send(rate);
    } catch (error) {
      res.status(500).send(error);
    }
  };

export { getOrder, addOrder, getOrderById }