const ronin     = require( 'ronin-server' )
const mocks     = require( 'ronin-mocks' )
const database  = require( 'ronin-database' )
const server = ronin.server()

database.connect( process.env.CONNECTIONSTRING )
// console.log(process.env)
// console.log('12345678QWERTYUIWERTYUASDFGHZXCVB')

server.use( '/foo', (req, res) => res.json({ "foo": "bar" }))
server.use( '/', mocks.server( server.Router(), false, false ) )
server.start()
