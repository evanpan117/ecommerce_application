/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useCallback, useState } from "react";
import { connect } from "react-redux";
import { initiateGetProduct } from "../actions/products";
import { resetErrors } from "../actions/errors";
import Tablewrapper from "./TableWrapper";
import { salesColumn } from "./Products/SaleColumns";
import { COUNT_TOTAL, SET_TOTAL_SALES, SET_SALE_CART, CLEAR_PRODUCT_CART } from '../utils/constants'
import { Button } from 'react-bootstrap';
import Swal from 'sweetalert2';
import { Link } from 'react-router-dom'
import { initiateGetSale } from "../actions/sale"

const Sale = (props) => {
  const processOnMount = useCallback(() => {
    props.dispatch(initiateGetProduct());
    return () => props.dispatch(resetErrors());
  }, []);

  useEffect(() => {
    processOnMount();
  }, [processOnMount]);

  useEffect(() => {
    props.dispatch({ type: COUNT_TOTAL })
  }, [props.products, props.cart])

  const SaleAction = () => {
    Swal.fire({
      icon: 'success',
      title: 'Sale Created Sucesfully',
      showConfirmButton: false,
      timer: 3000
    })
    props.dispatch(initiateGetSale())
    props.dispatch({
      type: SET_SALE_CART,
      cart: props.cart
    })
    props.dispatch({ type: CLEAR_PRODUCT_CART })

    console.log("product cart", props.cart)
    console.log("sale cart", props.saleCart)
  }

  return (
    <div className="content">
      <div className="subcontent" style={{ textAlign: 'right' }}>
        <Link to="/history">
          <Button
            variant="danger"
            onClick={() => SaleAction()}>
            Sale
        </Button></Link>
        <h3>total amount : {props.totalAmount}</h3>
      </div>


      <Tablewrapper
        columns={salesColumn}
        data={props.products || []}
        heading="Sales"
        hideExport={true}
      />
    </div>
  );
};

const mapStateToProps = (state) => ({
  totalAmount: state.product.productsTotal,
  cart: state.product.cart,
  saleCart: state.sale.saleCart,
  products: state.product.products,
  errors: state.errors,
});


export default connect(mapStateToProps)(Sale);
