const express = require('express')
const router = express.Router()
const User = require('../models/user.model')

// router.post('/signup', (req, res) => {
//     User.findOne({ email: req.body.email }).then((user) => {
//         if (user == null) {
//             const user = User({
//                 email: req.body.email,
//                 password: req.body.password,
//                 name: req.body.name
//             })
//             user.save()
//                 .then((err) => {
//                     if (err) {
//                         console.log(err)
//                         res.json(err)
//                     }
//                     else {
//                         console.log(user)
//                         res.json(user)
//                     }
//                 })
//         }
//         else {
//             res.json({
//                 message: 'email is not available'
//             })
//         }
//     }).catch((err) => {
//         console.log(err)
//         res.json(err)
//     })
// })

router.post('/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        // Check if the user already exists in the database
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(409).json({ message: 'Email is not available' });
        }

        // If the user does not exist, create a new user in the database
        const newUser = new User({ name, email, password });
        await newUser.save();
        res.status(201).json({ message: 'User registered successfully', user: newUser });
    } catch (error) {
        console.error('Error during user registration:', error);
        res.status(500).json({ message: 'An error occurred during user registration' });
    }
});

// router.post('/signin', (req, res) => {
//     User.findOne({ email: req.body.email, password: req.body.password }).then((user)=>{
//         console.log(user)
//         res.json(user)
//     }).catch((err)=>{
//         console.log(err)
//         res.json(err)
//     })
// })
router.post('/signin', async (req, res) => {
    try {
        const { email, password } = req.body;
        // Check if the user exists in the database
        const user = await User.findOne({ email, password });
        if (user) {
            res.status(200).json({ message: 'Login successful', user });
        } else {
            res.status(401).json({ message: 'Invalid credentials' });
        }
    } catch (error) {
        console.error('Error during user login:', error);
        res.status(500).json({ message: 'An error occurred during user login' });
    }
});
module.exports = router