
const {getDoors,getDoorById,create,deleteDoor} = require('../services/GaragedoorService')
module.exports= {
    addGaragedoor: (req, res) => {
        const body = req.body;
        create(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    status_code: 400,
                    description: "Database error:" + err
                });
            }
            return res.status(200).json({
                status_code: 201,
                description: "Successfully added to order",
                data: results
            });
        });
    },

    getDoorById: (req, res) => {
        const id = req.params.id;
        getDoorById(id, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    message: "There is no garage door with the ID:"+id
                });
            }
            return res.json({
                succes: 1,
                data: results
            });
        });
    },

    getDoors: (req, res) => {
        getDoors((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            console.log(results);
            return res.json({
                success: 1,
                data: results
            });
        });
    },

    deleteDoor: (req, res) => {
        const data = req.body;
        deleteDoor(data, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Nincs ilyen id-jű garázs ajtó."
                });
            }
            return res.json({
                success: 1,
                message: "Garázs ajtó sikeresen törölve."
            });
        });
    },
}