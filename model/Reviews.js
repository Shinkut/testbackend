const res = require('express/lib/response')
const mongoose = require('mongoose')
const Schema = mongoose.Schema

const rschema = new Schema
(
    {
    petsitterid:Number,
    rating:Number,
    comments:String,
},{versionKey: false})


module.exports = mongoose.model('Reviews', rschema)