const {create} = require('../services/GaragedoorService')

module.exports= {
    addGaragedoor: (req, res) => {
        const body = req.body;
        create(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: "Database connection error"
                });
            }
            return res.status(200).json({
                status_code: 201,
                description: "Successfully registered",
                data: results
            });
        });
    },
}