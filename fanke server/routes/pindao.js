const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.get("",(req,res)=>{
  pool.query("select * from pindao",(err,result)=>{
    if(err) throw err
    res.send(result)
  })
})
router.get("/shangwu",(req,res)=>{
  pool.query("select * from shangwu",(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})
router.get("/lunbo",(req,res)=>{
  pool.query("select * from shangwu_carousel",(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})
module.exports=router