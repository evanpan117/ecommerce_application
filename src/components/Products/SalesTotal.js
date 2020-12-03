import React, { useState, useEffect } from "react";
import { connect } from "react-redux";

const SalesTotal = (props) => {
    const { original, cart, saleCart } = props;
    const [total, setTotal] = useState(0)
    const [tcart, setTcart] = useState([])

    useEffect(() => {

        let thiscart = cart.filter(product => product.product_id === original.product_id)
        console.log(thiscart)
        if (thiscart.length > 0) {
            console.log(` id : ${original.product_id} , total : ${thiscart[0]}`)
            let total = thiscart[0].quentity * thiscart[0].product_price
            setTotal(total)
        }
    }, [cart])

    useEffect(() => {
        console.log("original", original)
        let total = original.quentity * original.product_price
        setTotal(total)
    }, [original.quentity])

    if (total > 0) {
        return (
            <>
                <h5>{total}</h5>
            </>
        )

    }
    else {
        return (
            <>
                <h5>0</h5>
            </>
        )
    }


}

const mapStateToProps = (state) => ({
    state: state,
    cart: state.product.cart,
    products: state.product.products,
    errors: state.errors,
});
export default connect(mapStateToProps)(SalesTotal)