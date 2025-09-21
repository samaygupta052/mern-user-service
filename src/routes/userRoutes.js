const express = require('express');
const router = express.Router();
const { getUserById } = require('../controllers/userController');

// Existing routes...
router.get('/:id', getUserById);

module.exports = router;
