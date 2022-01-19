const express = require('express')
const morgan = require('morgan')
const app = express()
const path = require ('path')
const mysql =require('mysql')
const conexsql = require('express-myconnection')
const db = require('./db')
const petrouter = require('./routes/petsit')


app.set('view engine', 'ejs')
app.set('views', path.join(__dirname,'views'))

app.use(morgan('dev'))
app.use(conexsql(mysql,
{
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'petsitter'
}, 'single' ))


app.use(express.urlencoded({extended:true}))


app.use('/', petrouter) 
app.use(express.static('public'))

app.get("/vtypes", (req, res) =>{
    res.render("vtypes")
})
app.get("/vreviews", (req, res) =>{
    res.render("vreviews")
})



app.listen(3000,() =>{
    console.log('Servidor establecido')
})