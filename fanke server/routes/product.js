const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.get("/man",(req,res)=>{
  pool.query("select * from man",(err,result)=>{
    res.send(result)
  })
})
router.get("/woman",(req,res)=>{
  pool.query("select * from woman",(err,result)=>{
    res.send(result)
  })
})
router.get("/details",(req,res)=>{
  var pid=req.query.pid;
  var obj={};
  var i=0;
  pool.query("select * from details where pid=?",[pid],(err,result)=>{
    if(result.length>0){
      i+=50;
      obj.details=result
      }if(i==150){
        res.send(obj)
    }
  });
  pool.query("select * from details_img where pid=?",[pid],(err,result)=>{
    if(result.length>0){
      i+=50;
      obj.details_img=result;
    }
    if(i==150){
      res.send(obj)
    }
  });
  pool.query("select * from spec where pid=?",[pid],(err,result)=>{
    if(result.length>0){
      i+=50;
      obj.spec=result;
    }
    if(i==150){
      res.send(obj)
    }
  });
})
module.exports=router