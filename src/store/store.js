import { createStore, combineReducers, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import authReducer from '../reducers/auth';
import errorsReducer from '../reducers/errors';
import profileReducer from '../reducers/profile';
import transactionsReducer from '../reducers/transactions';
import accountReducer from '../reducers/account';
import productReducer from '../reducers/products';
import saleReducer from '../reducers/sale'
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const store = createStore(
  combineReducers({
    auth: authReducer,
    errors: errorsReducer,
    profile: profileReducer,
    transactions: transactionsReducer,
    account: accountReducer,
    product: productReducer,
    sale: saleReducer
  }),
  composeEnhancers(applyMiddleware(thunk))
);

export default store;
