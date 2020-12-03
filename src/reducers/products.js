import {
  ADD_PRODUCT,
  UPDATE_PRODUCT,
  SYNC_PRODUCTS,
  SET_PRODUCT_EDIT,
  DELETE_PRODUCT,
  COUNT_TOTAL,
  ADD_TO_CART,
  CLEAR_PRODUCT_CART,
} from "../utils/constants";

const productReducer = (state = { products: [], product: {}, productsTotal: 0, cart: [] }, action) => {
  switch (action.type) {
    case ADD_PRODUCT:
      return { ...state, ...action.product };
    case SYNC_PRODUCTS:
      return { ...state, products: action.product };
    case SET_PRODUCT_EDIT:
      return { ...state, product: action.product };
    case UPDATE_PRODUCT:
      return { ...state, product: action.product };
    case DELETE_PRODUCT:
      return {
        ...state,
        products: state.products.filter(
          (product) => product.product_id !== action.product
        ),
      };
    case COUNT_TOTAL: {
      let sCart = state.cart
      let total_amount = 0
      sCart.forEach((product) => {
        let pTotal = product.quentity * product.product_price
        total_amount += pTotal
      })
      return {
        ...state,
        productsTotal: total_amount
      }
    }

    case ADD_TO_CART: {
      let newCart = state.cart
      let productID = action.product.product_id
      let index = newCart.findIndex(product => product.product_id === productID)
      console.log("index in cart", index)
      return {
        ...state,
        cart: [...state.cart, action.product]
      }
    }
    case CLEAR_PRODUCT_CART: {
      return {
        ...state,
        productsTotal: 0,
        cart: []
      }
    }
    default:
      return state;
  }
};

export default productReducer;
