import React from 'react';
import { Link } from 'react-router-dom';

const Header = () => {
  return (
    <header>
      <h1>Ecommerce Application</h1>
      <div className="links">
        <Link to="/product" className="link">
          Add Product
        </Link>
        <Link to="/productList" className="link">
          Product List
        </Link>
        <Link to="/sale" className="link">
          Sale
        </Link>
        <Link to="/history" className="link">
          History
        </Link>
        <Link to="/profile" className="link">
          Profile
        </Link>
        <Link to="/logout" className="link">
          Logout
        </Link>
      </div>
    </header>
  );
};

export default Header;
