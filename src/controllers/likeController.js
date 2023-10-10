import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

const getLike = async(req, res) => {
    let data = await model.like_res.findAll({
        include: ["user", "re"]
    }); 
    res.send(data);
}

const getLikeById = async (req, res) => {
  const { like_res_id } = req.params;

  let data = await model.like_res.findAll({
    where: {
      like_res_id,
    },
    include: ["user", "re"],
  });

  if (data) {
    res.send(data);
  } else {
    res.sendStatus(404);
  }
};

const addLike = async (req, res) => {
    const { user_id, res_id } = req.body;
  
    try {
      const like = await model.like_res.create({
        user_id,
        res_id,
        data_like: new Date(),
      });
  
      res.send(like);
    } catch (error) {
      res.status(500).send(error);
    }
  };

  const unLike = async (req, res) => {
    const { like_res_id } = req.params;
  
    try {
      await model.like_res.destroy({
        where: {
          like_res_id,
        },
      });
  
      res.sendStatus(204);
    } catch (error) {
      res.status(500).send(error);
    }
  };

export { getLike, getLikeById, addLike, unLike }