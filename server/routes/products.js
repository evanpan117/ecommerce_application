const express = require("express");
const authMiddleware = require("../middleware/auth");
const { pool } = require("../db/connect");
const { isInvalidField } = require("../utils/common");
const Router = express.Router();
Router.post("/addcart/product", async (req, res) => {
  try {
    const { product_id, product_quantity } = req.body;

    const validFieldsToUpdate = ["product_id", "product_quantity"];
    const receivedFields = Object.keys(req.body);

    const isInvalidFieldProvided = isInvalidField(
      receivedFields,
      validFieldsToUpdate
    );

    // return res.status(200).send({
    //     update: 'ok'
    //   });
    if (isInvalidFieldProvided) {
      return res.status(400).send({
        update_error: "Invalid field.",
      });
    }
    await pool
      .query(`select * from products where product_id=${product_id}`)
      .then((data) => {
        const dt = data.rows[0].product_quantity - product_quantity;

        console.log("dt", dt);
        pool
          .query(
            "update products set product_quantity=$1where product_id=$2 returning product_name,product_price,product_quantity,product_description,product_id",
            [dt, product_id]
          )
          .then((data) => {
            res.status(200).send({
              product: data.rows.length > 0 ? data.rows[0] : data.rows,
            });
          });
      });
    // res.send(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while creating product..Try again later.",
    });
  }
});

Router.post("/product", async (req, res) => {
  try {
    const {
      product_name,
      product_price,
      product_quantity,
      product_description,
    } = req.body;

    const validFieldsToUpdate = [
      "product_name",
      "product_price",
      "product_quantity",
      "product_description",
    ];
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
        update_error: "Invalid field.",
      });
    }

    const result = await pool.query(
      "insert into products(product_name, product_price, product_quantity, product_description) values($1,$2,$3,$4) returning *",
      [product_name, product_price, product_quantity, product_description]
    );

    res.send(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while creating product..Try again later.",
    });
  }
});

Router.get("/product", async (req, res) => {
  try {
    await pool.query("select * from products").then((data) => {
      // console.log(data.rows)
      res.status(200).send({
        products: data.rows,
      });
    });
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while getting product..Try again later.",
    });
  }
});

Router.get("/product/:id", async (req, res) => {
  const { id } = req.params;
  const validFieldsToUpdate = ["id"];
  const receivedFields = Object.keys(req.params);
  const isInvalidFieldProvided = isInvalidField(
    receivedFields,
    validFieldsToUpdate
  );

  if (isInvalidFieldProvided) {
    return res.status(400).send({
      update_error: "Invalid field.",
    });
  }

  try {
    await pool
      .query("select * from products where product_id=$1 limit 1", [id])
      .then((data) => {
        res.status(200).send({
          product: data.rows.length > 0 ? data.rows[0] : data.rows,
        });
      });
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while getting product..Try again later.",
    });
  }
});

Router.patch("/product/:id", async (req, res) => {
  const { id } = req.params;
  const {
    product_name,
    product_price,
    product_quantity,
    product_description,
  } = req.body;

  const validFieldsToUpdate = [
    "product_name",
    "product_price",
    "product_quantity",
    "product_description",
  ];
  const receivedFields = Object.keys(req.body);
  const isInvalidFieldProvided = isInvalidField(
    receivedFields,
    validFieldsToUpdate
  );

  if (isInvalidFieldProvided) {
    return res.status(400).send({
      update_error: "Invalid field.",
    });
  }
  try {
    await pool
      .query(
        "update products set product_name=$1,product_price=$2,product_quantity=$3,product_description=$4 where product_id=$5 returning product_name,product_price,product_quantity,product_description,product_id",
        [product_name, product_price, product_quantity, product_description, id]
      )
      .then((data) => {
        res.status(200).send({
          product: data.rows.length > 0 ? data.rows[0] : data.rows,
        });
      });
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while getting product..Try again later.",
    });
  }
});

Router.delete("/product/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const validFieldsToUpdate = ["id"];
    const receivedFields = Object.keys(req.body);

    const isInvalidFieldProvided = isInvalidField(
      receivedFields,
      validFieldsToUpdate
    );

    if (isInvalidFieldProvided) {
      return res.status(400).send({
        update_error: "Invalid field.",
      });
    }

    await pool.query("delete from products where product_id=$1", [id]);
    res.send();
  } catch (error) {
    console.error(error);
    res.status(400).send({
      update_error: "Error while getting product..Try again later.",
    });
  }
});

module.exports = Router;
