const {getMaterials} = require('../services/MaterialService');
const {getStyles} = require('../services/StyleService');
const {getDoorPrice,getParts,getPartsToDoor, getDoorTotalParts, partOrderCompleted, orderParts} = require('../services/PartsService');

module.exports = {
    getMaterials: (req, res) => {
        getMaterials((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            return res.json({
                success: 1,
                data: results
            });
        });
    },
    getDoorPrice:(req,res)=>{
        const id = req.params.id;
        getDoorPrice(id, (err,results)=>{
            if(err){
                console.log(err);
                return;
            }
            if(!results){
                return res.json({
                    message: "There is no door with the given ID:"+id
                });
            }
            return res.json({
                status:"Success",
                price: results.TOTAL
            });

        });
    },
    getPartsToDoor:(req,res)=>{
      const id = req.params.id;
      getPartsToDoor(id, (err,results)=>{
         if(err){
             console.log(err);
             return;
         }
         if(!results){
             return res.json({
                 message:"There is no door with the given ID:"+id
             });
         }
         return res.json({
             status:"Success",
             data: results
         })
      });
    },
    getStyles:(req,res)=>{
        getStyles((err,results) =>{
            if(err){
                console.log(err);
                return;
            }
            return res.json({
                success: 1,
                data: results
            });
        });

    },
    getParts:(req,res)=>{
        getParts((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            return res.json({
                success: 1,
                data: results
            });
        });
    },
    getDoorTotalParts:(req,res) =>{
      let id = req.params.id;
      getDoorTotalParts(id,(err,results)=>{
          if(err){
              console.log(err);
              return;
          }
          return res.json({
              message:"The parts of the door with ID:"+id,
              Parts: results
          });
      });
    },
    partOrderCompleted:(req,res)=>{
        const body = req.body;
        partOrderCompleted(body,(err,results)=>{
            if(err){
                console.log(err);
                return;
            }
            return res.status(200).json({
                message: "Confirmed order delivered."
            })
        })
    },
    orderParts:(req,res)=>{
        const body = req.body;
        orderParts(body, (err,results)=>{
            if(err){
                console.log(err);
                return;
            }
            return res.status(200).json({
                message: "Parts order added."
            })
        })
    }

};