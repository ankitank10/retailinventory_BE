const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const app = express();
const cors = require('cors');
const swaggerJSDoc = require('swagger-jsdoc');
const swaggerUI = require('swagger-ui-express');

const swaggerOptions = {
    swaggerDefinition: {
        info: {
            title: "Retail Inventory API",
            description: "Backend Api",
            contact: {
                name: 'Y Company'
            },
            servers: "http://localhost:3636"
        }
    },
    apis: ["app.js", ".routes/*.js"]
};

const swaggerDocs = swaggerJSDoc(swaggerOptions);
app.use('/api/docs', swaggerUI.serve, swaggerUI.setup(swaggerDocs));


/* CORS */
app.use(cors({
    origin: '*',
    methods: ['GET', 'PUT', 'DELETE', 'PATCH', 'POST'],
    allowedHeaders: 'Content-Type, Authorization, Origin, X-Requested-With, Accept'
}));
app.use(logger('combined'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
var options = {
    etag: false,
    maxAge: '1d',
    redirect: false,
    setHeaders: function (res, path, stat) {
        res.set('x-timestamp', Date.now())
    }
}
app.use(express.static(path.join(__dirname, 'public'), options));



// Import Routes
const usersRouter = require('./routes/users');
const productsRouter = require('./routes/products');
const authRouter = require('./routes/auth');
const orderRouter = require('./routes/order');

// Define Routes

app.use('/api/users', usersRouter);
app.use('/api/products', productsRouter);
app.use('/api/auth', authRouter);
app.use('/api/orders', orderRouter);

module.exports = app;
