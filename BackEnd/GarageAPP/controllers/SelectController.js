const {getMaterials} = require('../services/MaterialService');

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
        
    },
};