/* eslint-disable react-hooks/exhaustive-deps */
import React, { useState, useEffect, useCallback } from 'react';
import { connect } from 'react-redux';
import { Form, Button } from 'react-bootstrap';
import { initiateUpdateProduct,getProductById } from '../actions/products';
import { validateFields } from '../utils/common';
import { resetErrors } from '../actions/errors';

const ProductEdit = (props) => {
  const [state, setState] = useState({
    product_name: '',
    product_price: '',
    product_quantity: '',
    product_description: '',
    product_id:''
  });
  const [errorMsg, setErrorMsg] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);
  const {id}=props.match.params

  const processOnMount = useCallback(() => {
    props.dispatch(getProductById(id));
    return () => props.dispatch(resetErrors());
  }, []);

  useEffect(() => {
    processOnMount();
  }, [processOnMount]);

  useEffect(() => {
    setState(props.product);
  }, [props, props.product]);

  useEffect(() => {
    setErrorMsg(props.errors);
  }, [props, props.errors]);

  const handleSubmit = (event) => {
    event.preventDefault();
    const { product_name, product_price, product_quantity, product_description,product_id } = state;
    const productData = {
        product_name,
        product_price,
        product_quantity,
        product_description 
    };

    const fieldsToValidate = [{ product_name }, { product_price }, {product_quantity}];

    const allFieldsEntered = validateFields(fieldsToValidate);
    if (!allFieldsEntered) {
      setErrorMsg({
        update_error: 'Please enter all the fields.'
      });
    } else {
      setIsSubmitted(true);
      setErrorMsg('');
      props.dispatch(initiateUpdateProduct(product_id,productData));
    }
  };

  const handleOnChange = (event) => {
    const { name, value } = event.target;
    setState({
      ...state,
      [name]: value
    });
  };
  console.log('processOnMount',props)
  return (
    <div className="col-md-6 offset-md-3">
      <Form onSubmit={handleSubmit} className="profile-form">
        
        {errorMsg && errorMsg.update_error ? (
          <p className="errorMsg centered-message">{errorMsg.update_error}</p>
        ) : (
          isSubmitted && (
            <p className="successMsg centered-message">
              Product updated successfully.
            </p>
          )
        )}
        <Form.Group controlId="product_name">
          <Form.Label>Product name:</Form.Label>
          <Form.Control
            type="text"
            name="product_name"
            placeholder="Enter product name"
            value={state.product_name || ''}
            onChange={handleOnChange}
          />
          {/* <span className="label-value">{state.product_name || ''}</span> */}
        </Form.Group>

        <Form.Group controlId="product_price">
          <Form.Label>Product price:</Form.Label>
          <Form.Control
            type="integer"
            name="product_price"
            placeholder="Enter product price"
            value={state.product_price || ''}
            onChange={handleOnChange}
          />
        </Form.Group>

        <Form.Group controlId="product_quantity">
          <Form.Label>Product quantity:</Form.Label>
          <Form.Control
            type="integer"
            name="product_quantity"
            placeholder="Enter product quantity"
            value={state.product_quantity || ''}
            onChange={handleOnChange}
          />
        </Form.Group>

        <Form.Group controlId="product_description">
          <Form.Label>Product description:</Form.Label>
          <Form.Control
            type="text"
            name="product_description"
            placeholder="Enter product description"
            value={state.product_description || ''}
            onChange={handleOnChange}
          />
        </Form.Group>

        <Button variant="primary" type="submit">
          Update
        </Button>
      </Form>
    </div>
  );
};

const mapStateToProps = (state) => ({
  product: state.product.product,
  errors: state.errors
});

export default connect(mapStateToProps)(ProductEdit);
