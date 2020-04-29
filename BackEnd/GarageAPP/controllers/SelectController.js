const {getMaterials} = require('../services/MaterialService');
const {getStyles} = require('../services/StyleService');

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