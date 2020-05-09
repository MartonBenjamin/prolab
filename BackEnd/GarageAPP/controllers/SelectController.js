const {getMaterials} = require('../services/MaterialService');
const {getStyles} = require('../services/StyleService');
const {getDoorPrice,getParts,getPartsToDoor} = require('../services/PartsService');

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
    //TODO: getDoorTotalParts orderParts orderCompleted implementálása
    //TODO: getDoorPrice mintájára egy fügvény, amely visszaadja, az árat, ha esetleg kedvezményes.
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

};