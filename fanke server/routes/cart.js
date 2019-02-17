const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.get("/add",(req,res)=>{
  var uid=req.session.uid;
  var pid=parseInt(req.query.pid);
  var spec=parseInt(req.query.spec);
  var color=req.query.color;
  var count=parseInt(req.query.count);
  var price=parseInt(req.query.price);
  var selected=1;
  console.log(uid,pid,spec,color,count,price)
  pool.query("select * from cart where uid=? and pid=? and spec=? and color=?",[uid,pid,spec,color],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      count+=result[0].count
      pool.query("update cart set count=? where uid=? and pid=? and spec=? and color=?",[count,uid,pid,spec,color],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
          res.send({code:1,msg:"添加成功"})
        }else{
          res.send({code:-1,msg:"添加失败"})
        }
      })
    }else{
      pool.query("insert into cart values(null,?,?,?,?,?,?,?)",[uid,pid,price,count,spec,color,selected],(err,result)=>{
        if(err) throw err
        if(result.affectedRows>0){
          res.send({code:1,msg:"添加成功"})
        }else{
          res.send({code:-1,msg:"添加失败"})
        }
      })
    }
  }) 
});
router.get("",(req,res)=>{
  var uid=req.session.uid;
  pool.query("select c.selected,c.id,c.uid,c.price,c.count,c.spec,c.color,c.pid,d.img,d.title from cart c,shangwu d WHERE uid=1 and d.pid=c.pid and d.color=c.color",[uid],(err,result)=>{
    if(err) throw err;
    res.send(result)
  })
})
router.get("/updateSelected",(req,res)=>{
  var selected=req.query.selected;
  var id=parseInt(req.query.id);
  console.log(selected)
  if(selected=="false"){
    selected=0
  }else{
    selected=1
  }
  console.log(selected,id)
  pool.query("update cart set selected=? where id=?",[selected,id],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"添加成功"})
    }
  })
})
router.get("/updateAllSelected",(req,res)=>{
  var selected=req.query.bool;
  var uid=req.session.uid;
  console.log(selected,uid)
  pool.query("update cart set selected=? where uid=?",[selected,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"更新成功"})
    }
  })
})
router.get("/updatecount",(req,res)=>{
  var count=req.query.count;
  var id=req.query.id
  pool.query("update cart set count=? where id=?",[count,id],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"更新成功"})
    }
  })
})
router.get("/del",(req,res)=>{
  var id=req.query.id;
  var sql="delete from cart where id in("+id+")"
  console.log(sql)
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }
  })
})
module.exports=router