const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
 res.send('21BCP125, THIS IS CLOUD IA-2 NODE BACKEND !!🤩🤩');
});

app.listen(port, () => {
 console.log(`Node.js backend listening at http://localhost:${port}`);
});
