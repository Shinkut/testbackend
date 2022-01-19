const mongoose = require('mongoose')
const url = 'mongodb://0.0.0.0:27017/PetSitter'

mongoose.connect(url, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    })

const db = mongoose.connection
db.on('error', console.error.bind(console, 'error de conexion'))
db.once('open', function callback() {
    console.log('conexion exitosa')
})

module.exports = db