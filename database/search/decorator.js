const Decorator = require('sequelize-es-decorator');
const config = require('../../config/database').elasticSearch;

module.exports = new Decorator({
    host: config.address,
    log: config.log,
    node: 'http://localhost:9200'
}, 'inventory_BE');