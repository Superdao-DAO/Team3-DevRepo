module.exports = {
  build: {
    "index.html": "index.html",
    "app.js": [
      "javascripts/app.js"
    ],
    "app.css": [
      "stylesheets/app.css"
    ]
  },
  deploy: [
    //Check in documentation: is deployment order correct ?  
    "Action",
    "ActionsDB",
    "ActionsManager",
    "Doug",
    "GroveAPI",
    "Math",
    "MathAddAction",
    "Owned"
  ],
  rpc: {
    host: "localhost",
    port: 8545
  }
};
