import React from 'react';
import { connect } from 'react-redux';
import _ from 'lodash';
import { createBrowserHistory } from 'history';
import { Route, Switch, Router } from 'react-router-dom';
import Login from '../components/Login';
import Register from '../components/Register';
import Profile from '../components/Profile';
import Header from '../components/Header';
import Logout from '../components/Logout';
import Account from '../components/Account';
import Products from '../components/Products';
import Sale from '../components/Sale';
import productList from '../components/ProductList';
import ProductEdit from '../components/ProductEdit';
import History from '../components/History'


export const history = createBrowserHistory();

const AppRouter = ({ auth }) => {
  return (
    <Router history={history}>
      <div>
        {!_.isEmpty(auth.token) && <Header />}
        <div className="container">
          <Switch>
            <Route path="/" component={Login} exact={true} />
            <Route path="/register" component={Register} />
            <Route path="/history" component={History} />
            <Route path="/profile" component={Profile} />
            <Route path="/logout" component={Logout} />
            <Route exact path="/product" component={Products} />
            <Route path="/product/:id" component={ProductEdit} />
            <Route path="/productList" component={productList} />
            <Route path="/sale" component={Sale} />

            {/* <Route path="/sale" component={Sale}/> */}
          </Switch>
        </div>
      </div>
    </Router>
  );
};

const mapStateToProps = (state) => ({
  auth: state.auth
});

export default connect(mapStateToProps)(AppRouter);
