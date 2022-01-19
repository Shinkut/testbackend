const express =require ('express')
const router = express.Router()
const pcontroller = require('../controllers/pcontroller')


router.get('/', pcontroller.read);
router.post('/insert', pcontroller.insert);
router.get('/delete/:id', pcontroller.delete);
router.post('/update', pcontroller.update);
router.get('/vtypes', pcontroller.tyread);
router.get('/vreviews', pcontroller.conread);
router.post('/moninsert', pcontroller.moninsert);
router.get('/tydelete/:id', pcontroller.tydelete);
router.post('/tyinsert', pcontroller.tyinsert);

module.exports = router;
