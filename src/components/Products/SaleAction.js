import React, { useState } from "react";
import { connect } from "react-redux";
import { Button, Row, Col, Container } from "react-bootstrap";
import { history } from "../../router/AppRouter";
import { initiateDeleteProduct, initiateAddProductCart } from "../../actions/products";
import { ADD_TO_CART } from "../../utils/constants";
import Swal from 'sweetalert2';
import { initiateUpdateSale } from "../../actions/sale"

const SaleActionCell = (props) => {
  const { original } = props;
  const [saleQuentity, setSaleQuentity] = useState(0);
  const handleEdit = () => {
    history.push(`/product/${original.product_id}`);
  };

  const handleDelete = () => {
    props.dispatch(initiateDeleteProduct(original.product_id));
  };

  const countTotal = (ID) => {

    const cartData = {
      product_id: ID,
      product_quantity: saleQuentity,
      // product_name: product[0].product_name,
      // product_price: product[0].product_price,
    };

    let product = props.products.filter((product) => product.product_id === ID);

    let productPrice = product[0].product_price * saleQuentity;

    if (saleQuentity > product[0].product_quantity) {
      Swal.fire({
        icon: 'error',
        title: 'not enough product in stock',
        showConfirmButton: true,
        timer: 3000
      })
    } else {
      props.dispatch(initiateAddProductCart(cartData));
      const saleData = {
        sale_product_id: ID,
        sale_product_name: product[0].product_name,
        sale_price: productPrice,
        sale_quantity: saleQuentity,
        sale_total: product[0].product_quantity
      }
      props.dispatch(initiateUpdateSale(saleData))

      props.dispatch({
        type: ADD_TO_CART,
        product: {
          product_id: ID,
          quentity: saleQuentity,
          product_name: product[0].product_name,
          product_price: product[0].product_price,
          product_quantity: product[0].product_quantity,
          product_description: product[0].product_description
        },
      });
    }

  };

  return (
    <>
      <Container>
        <Row>
          <input
            className="mr-2"
            type="number"
            name="quantity"
            value={saleQuentity}
            onChange={(e) => setSaleQuentity(e.target.value)}
            style={{ width: "50px", height: "50px" }}
          />

          <Button
            variant="danger"
            onClick={() => countTotal(original.product_id)}
          >
            Add To Cart
          </Button>
        </Row>
      </Container>
    </>
  );
};

const mapStateToProps = (state) => ({
  products: state.product.products,
  errors: state.errors,
});

export default connect(mapStateToProps)(SaleActionCell);
