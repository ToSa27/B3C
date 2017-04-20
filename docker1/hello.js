const http = require('http');
var server = http.createServer((req, res) => {
	res.writeHead(200, {'Content-Type': 'text/plain', 'Cache-Control': 'no-cache'});
	res.end('Hello from host ' + process.env.HOSTNAME);
});
server.listen(3000);
