import { BASE_API_URL } from '../utils/constants';
import { getErrors } from './errors';
import { UPDATE_SALE } from '../utils/constants';
import { get, post } from '../utils/api';

export const updateSale = (sale) => ({
  type: UPDATE_SALE,
  sale
});

export const initiateUpdateSale = (saleData) => {
  return async (dispatch) => {
    try {
      const sale = await post(`${BASE_API_URL}/sale`, saleData);

      dispatch(updateSale(sale.data));
    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};

export const initiateGetSale = () => {
  return async (dispatch) => {
    try {
      const sale = await get(`${BASE_API_URL}/sale`);
      dispatch(updateSale(sale.data.sale));

    } catch (error) {
      error.response && dispatch(getErrors(error.response.data));
    }
  };
};
