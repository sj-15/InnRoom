const mongoose = require('mongoose')
const Schema = mongoose.Schema
const newSchema = new Schema({
    email: String,
    password: String,
    name: String
})
module.exports = mongoose.model('User', newSchema)