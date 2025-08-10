// server.js
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const axios = require('axios');
const xml2js = require('xml2js');
const https = require('https');

// Import route files
const maintLoginRoute = require('./maintenanceLogin');
const maintNotify = require('./maintenanceNotisfy');
const maintPlant = require('./maintenancePlant');
const maintWork = require('./maintenanceWork');

const app = express();
// app.use('/api/maint/work', maintWork);
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(bodyParser.json());

// Route mounting
app.use('/api/maint/', maintLoginRoute);  // if you move login to route file
app.use('/api/maint/', maintNotify)
app.use('/api/maint/', maintPlant);
app.use('/api/maint/', maintWork);


// Start server
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
});
