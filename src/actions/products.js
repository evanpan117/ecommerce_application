import { BASE_API_URL } from "../utils/constants";
import { getErrors } from "./errors";
import {
  ADD_PRODUCT,
  UPDATE_PRODUCT,
  SYNC_PRODUCTS,
  SET_PRODUCT_EDIT,
  DELETE_PRODUCT,
} from "../utils/constants";
import { get, post, patch, deletApi } from "../utils/api";

export const addProduct = (product) => ({
  type: ADD_PRODUCT,
  product,
});

export const syncProducts = (product) => ({
  type: SYNC_PRODUCTS,
  product,
});

export const setProductEdit = (product) => ({
  type: SET_PRODUCT_EDIT,
  product,
});

export const updateProduct = (product) => ({
  type: UPDATE_PRODUCT,
  product,
});

export const deleteProduct = (productId) => ({
  type: DELETE_PRODUCT,
  product: productId,
});

export const initiateAddProduct = (productData) => {
  return async (dispatch) => {
    try {
      const product = await post(`${BASE_API_URL}/product`, productData);
      dispatch(addProduct(product.data));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};
export const initiateAddProductCart = (cartData) => {
  return async (dispatch) => {
    try {
      const product = await post(`${BASE_API_URL}/addcart/product`, cartData);
      dispatch(addProduct(product.data));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};
export const initiateGetProduct = () => {
  return async (dispatch) => {
    try {
      const product = await get(`${BASE_API_URL}/product`);
      dispatch(syncProducts(product.data.products));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};

export const getProductById = (productId) => {
  return async (dispatch) => {
    try {
      const product = await get(`${BASE_API_URL}/product/${productId}`);
      dispatch(setProductEdit(product.data.product));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};

export const initiateUpdateProduct = (productId, payload) => {
  return async (dispatch) => {
    try {
      const product = await patch(
        `${BASE_API_URL}/product/${productId}`,
        payload
      );
      dispatch(updateProduct(product.data.product));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};

export const initiateDeleteProduct = (productId) => {
  return async (dispatch) => {
    try {
      await deletApi(`${BASE_API_URL}/product/${productId}`);
      dispatch(deleteProduct(productId));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};
