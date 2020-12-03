import React, { useState, useEffect, useCallback, useRef } from "react";
import { Form, Button } from "react-bootstrap";
import { connect } from "react-redux";
import SalesTotal from '../components/Products/SalesTotal'
import { initiateGetProduct } from "../actions/products";
import { initiateGetSale } from "../actions/sale"

import { resetErrors } from "../actions/errors";
import { COUNT_TOTAL, UPDATE_SALE } from "../utils/constants";
import BootstrapTable from "react-bootstrap-table-next";

const columns = [
  {
    dataField: "sale_product_id",
    text: "Id",
    align: "center",
    headerAlign: "center",
    sort: true,
    csvFormatter: (cell, row, rowIndex) => cell || "",
  },
  {
    dataField: "sale_product_name",
    text: "Name",
    sort: true,
    csvFormatter: (cell, row, rowIndex) => cell || "",
  },

  {
    dataField: "sale_price",
    text: "Price",

  },
  {
    dataField: "sale_quantity",
    text: "Quantity",
    align: "center",
    headerAlign: "center",
    csvFormatter: (cell, row, rowIndex) => cell || "",
    sort: true,
  },
  {
    dataField: "sale_total",
    text: "Total",
    align: "center",
    headerAlign: "center",
    csvFormatter: (cell, row, rowIndex) => cell || "",
    sort: true,
  },

];

const AccountForm = (props) => {

  const { cart, sale } = props;
  const processOnMount = useCallback(() => {
    props.dispatch(initiateGetProduct());

    return () => props.dispatch(resetErrors());
  }, []);

  useEffect(() => {
    processOnMount();
  }, [processOnMount]);
  useEffect(() => {
    //   props.dispatch({type:UPDATE_SALE})
    //  console.log('jj',props.sale) 
    props.dispatch({ type: COUNT_TOTAL });
  }, [props.products, props.cart]);
  useEffect(() => {
    props.dispatch(initiateGetSale())
    console.log('jj', props.sale)
  }, [props.cart])
  const getTotal = () => {
    let total = 0
    if (props.cart.length > 0) {
      props.cart.map(product => {
        let iTotal = product.product_price * product.quentity
        total += iTotal
      })
    }

    return total
  }

  return (
    <div className="content">
      <div className="subcontent" style={{ textAlign: 'right' }}>
        <h3>total Sale :{getTotal()}</h3>
      </div>
      <BootstrapTable
        keyField="id"
        columns={columns}
        data={props.sale || []}
      />
    </div>
  );
};

const mapStateToProps = (state) => ({
  cart: state.sale.saleCart,
  sale: state.sale.saleData,
  products: state.product.products,
  errors: state.errors,
});

export default connect(mapStateToProps)(AccountForm);
