import React from "react";
import { connect } from "react-redux";
import { Button } from 'react-bootstrap';
import { history } from '../../router/AppRouter';
import { initiateDeleteProduct } from '../../actions/products';

const ActionCell = (props) => {
  const { original } = props;
  const handleEdit = () => {
      history.push(`/product/${original.product_id}`);
  };

  const handleDelete = () => {
    props.dispatch(initiateDeleteProduct(original.product_id));
};
  return (
    <>
        <Button
          variant="secondary"
          className="mr-2"
          onClick={() => handleEdit()}
        >
          Edit
        </Button>

        <Button
          variant="danger"
          onClick={() => handleDelete()}
        >
          Delete
        </Button>
    </>
  );
};

const mapStateToProps = (state) => ({
    products: state.product.products,
    errors: state.errors,
  });
  
  export default connect(mapStateToProps)(ActionCell);

