const {fork} = require('child_process');
const dotenv = require("dotenv");

dotenv.config();

module.exports = (file) => {
    const child = fork(`${file}`);

    child.on('message', console.log);
}