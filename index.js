var express = require('express');

const app = express()

app.get('/', (req,resp) => {
	resp.send('Hello');
})

app.listen(3000, () => {console.log('listening on 3000')})
