import {
  UPDATE_SALE,
  SET_TOTAL_SALES,
  SET_SALE_CART,
} from '../utils/constants';

const saleReducer = (state = { saleData: [], saleCart: [], salesAmount: 0 }, action) => {
  switch (action.type) {
    case UPDATE_SALE:
      return {
        ...state,
        saleData: action.sale
      };

    case SET_TOTAL_SALES:
      {
        return {
          ...state,
          salesAmount: action.totalamount
        }
      }
    case SET_SALE_CART: {
      return {
        ...state,
        saleCart: [...state.saleCart, action.cart]
      }
    }

    default:
      return state;
  }
};

export default saleReducer;
