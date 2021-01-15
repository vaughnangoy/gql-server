const { Pool } = require('pg');
const SQL = require('./queries');

console.log(`connecting to ${process.env.PGDATABASE} postgress database on ${process.env.PGHOST} as ${process.env.PGUSER}`);

async function connect() {

    try {
        const pool = new Pool();

        const res = await pool.query(SQL.SELECT.ALL_USER_PROFILES);
        await pool.end();

        console.log(`${process.env.PGDATABASE} response:`, res);
    } catch (e) {
        console.error(e);
    }
}

connect();
