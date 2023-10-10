import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

const getRate = async(req, res) => {
    let data = await model.rate_res.findAll({
        include: ["user", "re"]
    }); 
    res.send(data);
}

const getRateById = async (req, res) => {
  const { rate_res_id } = req.params;

  let data = await model.rate_res.findAll({
    where: {
      rate_res_id,
    },
    include: ["user", "re"],
  });

  if (data) {
    res.send(data);
  } else {
    res.sendStatus(404);
  }
};

const addRate = async (req, res) => {
    const { user_id, res_id, amount } = req.body;
  
    try {
      const rate = await model.rate_res.create({
        user_id,
        res_id,
        amount,
        data_rate: new Date(),
      });
  
      res.send(rate);
    } catch (error) {
      res.status(500).send(error);
    }
  };

export { getRate, addRate, getRateById }