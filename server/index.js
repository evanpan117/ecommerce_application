const express = require('express');
const cors = require('cors')
const authRoute = require('./routes/auth');
const profileRoute = require('./routes/profile');
const accountRoute = require('./routes/account');
const transactionsRoute = require('./routes/transactions');
const productsRoute = require('./routes/products');
const salesRoute = require('./routes/sale')

require('dotenv').config();

const app = express();
app.use(cors())
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.set('view engine', 'ejs');
app.use(authRoute);
app.use(accountRoute.Router);
app.use(profileRoute);
app.use(transactionsRoute);
app.use(productsRoute)
app.use(salesRoute)

app.listen(PORT, () => {
  console.log(`server started on port ${PORT}`);
});
