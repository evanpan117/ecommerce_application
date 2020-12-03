const express = require('express');
const authMiddleware = require('../middleware/auth');
const { pool } = require('../db/connect');
const { isInvalidField } = require('../utils/common');
const Router = express.Router();

Router.post('/sale', async (req, res) => {
    try {
        const { sale_product_id, sale_product_name, sale_price, sale_quantity, sale_total } = req.body;

        const validFieldsToUpdate = ['sale_product_id', 'sale_product_name', 'sale_price', 'sale_quantity', 'sale_total'];
        const receivedFields = Object.keys(req.body);
        // console.log(product_name)

        const isInvalidFieldProvided = isInvalidField(
            receivedFields,
            validFieldsToUpdate
        );

        // return res.status(200).send({
        //     update: 'ok'
        //   });
        if (isInvalidFieldProvided) {
            return res.status(400).send({
                update_error: 'Invalid field.'
            });
        }
        //saving data to database
        const result = await pool.query(
            'insert into sales(sale_product_id, sale_product_name, sale_price, sale_quantity,sale_total) values($1,$2,$3,$4,$5) returning *',
            [sale_product_id, sale_product_name, sale_price, sale_quantity, sale_total]
        );

        res.send(result.rows[0]);

    } catch (error) {
        console.error(error);
        res.status(400).send({
            update_error: 'Error while creating product..Try again later.'
        });
    }
});

Router.get('/sale', async (req, res) => {
    try {
        await pool.query("select * from sales").then((data) => {
            // console.log(data.rows)
            res.status(200).send({
                sale: data.rows,
            });
        });

    } catch (error) {
        res.status(400).send({
            update_error: 'Error while creating product..Try again later.'
        });
    }
});

module.exports = Router;

