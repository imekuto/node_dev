var sys = require( 'sys' );
var http = require( 'http' );

var server = http.createServer(
    function ( request, response ) {
        response.writeHead(200, { 'Content-Type': 'text/plain' } );
        response.write( 'Hello World World!!' );
        response.end();
    }
).listen( 8080 );

sys.log('Server running at http://localhost:8080/');