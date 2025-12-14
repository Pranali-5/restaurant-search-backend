const express = require('express')
const router = express.Router()
const { searchDishes } = require('../controllers/search.controller')

router.get('/dishes', searchDishes)

module.exports = router
