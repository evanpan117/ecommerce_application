const { Pool } = require('pg');

const pool = new Pool({
  user: 'evan',
  password: 'root',
  host: 'localhost',
  port: 5432,
  database: 'bankingdb'
});
const getClient = async () => {
  try {
    const client = await pool.connect();
    return client;
  } catch (error) {
    return null;
  }
};

module.exports = { pool, getClient };