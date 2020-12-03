import React, { useState, useEffect, useCallback, useRef } from "react";
import { Form, Button } from "react-bootstrap";
import { connect } from "react-redux";
import SalesTotal from '../components/Products/SalesTotal'
import { initiateGetProduct } from "../actions/products";
import { resetErrors } from "../actions/errors";
import { COUNT_TOTAL, UPDATE_SALE } from "../utils/constants";
import BootstrapTable from "react-bootstrap-table-next";
import { initiateGetSale } from "../actions/sale"
import History2 from './History2'
const columns = [
    {
        dataField: "sale_id",
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
        text: "Total Item",
        align: "center",
        headerAlign: "center",
        csvFormatter: (cell, row, rowIndex) => cell || "",
        sort: true,
    },

];

const History = (props) => {

    const { cart, sale } = props;
    const [saleData, setSaleData] = useState([])
    useEffect(() => {
        //   props.dispatch({type:UPDATE_SALE})
        props.dispatch(initiateGetSale())
        // console.log('jj', props.sale)
        setSaleData(sale)
    }, []);

    const getTotal = () => {
        let total = 0
        if (props.sale.length > 0) {
            props.sale.map(product => {
                let iTotal = product.sale_price * product.sale_quantity
                total += iTotal
            })
        }

        return total
    }
    console.log("saleData", saleData)
    console.log("saleData", props.sale)
    return (
        <>
            {
                cart.length > 0 ? <History2 /> :
                    (
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
                    )
            }
        </>

    );
};

const mapStateToProps = (state) => ({
    cart: state.sale.saleCart,
    sale: state.sale.saleData,
    products: state.product.products,
    errors: state.errors,
});

export default connect(mapStateToProps)(History);
