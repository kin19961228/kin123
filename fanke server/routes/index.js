const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.get("",(req,res)=>{
    pool.query("select * from index_carousel",(err,result)=>{
        if(result.length>0){
            res.send(result)
        }
    })
})
router.get("/navimg",(req,res)=>{
    pool.query("select * from nav_img",(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})
router.get("/second",(req,res)=>{
    pool.query("select * from second",(err,result)=>{
        if(err) throw err;
        res.send(result)
    })
})
router.get("/2",(req,res)=>{
    pool.query("select * from index_carousel2",(err,result)=>{
        if(result.length>0){
            res.send(result)
        }
    })
})
module.exports=router