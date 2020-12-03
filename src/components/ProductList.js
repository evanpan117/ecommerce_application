/* eslint-disable react-hooks/exhaustive-deps */
import React, { useEffect, useCallback } from "react";
import { connect } from "react-redux";
import { initiateGetProduct } from "../actions/products";
import { resetErrors } from "../actions/errors";
import Tablewrapper from "./TableWrapper";
import { productsColumns } from "./Products/Columns";

const Products = (props) => {
  const processOnMount = useCallback(() => {
    props.dispatch(initiateGetProduct());
    return () => props.dispatch(resetErrors());
  }, []);

  useEffect(() => {
    processOnMount();
  }, [processOnMount]);

  return (
    <div className="content">
      <Tablewrapper
        columns={productsColumns}
        data={props.products || []}
        heading="Products"
        exportCSV={{
          exportAll: false,
          fileName: "users.csv",
          ignoreHeader: false,
          noAutoBOM: false,
        }}
      />
    </div>
  );
};

const mapStateToProps = (state) => ({
  products: state.product.products,
  errors: state.errors,
});

export default connect(mapStateToProps)(Products);
