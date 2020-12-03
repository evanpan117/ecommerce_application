import React, { useState, useEffect, useCallback, useRef } from "react";
import { Form, Button } from "react-bootstrap";
import { connect } from "react-redux";
import SalesTotal from '../components/Products/SalesTotal'
import { initiateGetProduct } from "../actions/products";
import { resetErrors } from "../actions/errors";
import { COUNT_TOTAL } from "../utils/constants";
import BootstrapTable from "react-bootstrap-table-next";

const columns = [
    {
        dataField: "product_name",
        text: "Name",
        sort: true,
        csvFormatter: (cell, row, rowIndex) => cell || "",
    },

    {
        dataField: "product_price",
        text: "Price",
        sort: true,
        csvFormatter: (cell, row, rowIndex) => cell || "",
    },
    {
        dataField: "quentity",
        text: "Quantity",
        align: "center",
        headerAlign: "center",
        csvFormatter: (cell, row, rowIndex) => cell || "",
        sort: true,
    },
    {
        dataField: "total",
        text: "Total",
        align: "center",
        headerAlign: "center",
        formatter: (row, original) => <SalesTotal original={original} />,
        sort: true,
    },
];

const History = (props) => {

    const { cart } = props;

    useEffect(() => {
        console.log('p', props.cart)
        props.dispatch({ type: COUNT_TOTAL });
    }, [props.products, props.cart]);

    const getTotal = (cart) => {
        let total = 0
        console.log('t cart', cart)
        if (cart.length > 0) {
            cart.map(product => {
                let iTotal = product.product_price * product.quentity
                total += iTotal
                console.log(total)
            })
        }

        return total
    }
    return (

        <>
            { cart.length > 1 ?
                (cart.map((cartArray, index) => (
                    <div className="content">
                        <h2 style={{ textAlign: 'center' }}>sale {index + 1}</h2>
                        <div className="subcontent" style={{ textAlign: 'right' }}>
                            <h3>total Sale :{getTotal(cartArray)}</h3>
                        </div>
                        <BootstrapTable
                            keyField="id"
                            columns={columns}
                            data={cartArray || []}
                        /><hr />
                    </div>))) :

                <div className="content">
                    <div className="subcontent" style={{ textAlign: 'right' }}>
                        <h3>total Sale :{getTotal(cart[0])}</h3>
                    </div>
                    <BootstrapTable
                        keyField="id"
                        columns={columns}
                        data={cart[0] || []}
                    /><hr />
                </div>

            }
        </>


    );
};

const mapStateToProps = (state) => ({
    cart: state.sale.saleCart,
    products: state.product.products,
    errors: state.errors,
});

export default connect(mapStateToProps)(History);
