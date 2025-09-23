const express = require('express');
const router = express.Router();
const { getUserById } = require('../controllers/userController');

router.get('/', (req, res) => {
  res.send('User Service is running');
});

// Existing routes...
router.get('/:id', getUserById);

module.exports = router;
