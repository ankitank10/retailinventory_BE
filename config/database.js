

module.exports = {
    HOST: "localhost",
    USER: "root",
    PASSWORD: "ank6117599",
    DB: "inventory_BE",
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000

    },
    elasticSearch: {
        address: 'localhost:9200',
        log: 'info'
    }
};

