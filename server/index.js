const express = require('express')
const app = express()
const port = 3000 || process.env.PORT
const cors = require('cors')
const bodyParser = require('body-parser')
const mongoose = require('mongoose')

mongoose.connect("mongodb+srv://sj15sourav:eNUhQ6xYob2hWmUK@innroom.e5b9tll.mongodb.net/")

app.use(cors())
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())
app.use('/', require('./routes/user.route'))
app.listen(port,()=>{
    console.log(`Server is running on port ${port}`);
})