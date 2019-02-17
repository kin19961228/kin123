const express=require('express');
const pool=require('../pool.js');
var router=express.Router();

router.post("/register",(req,res)=>{
  var name=req.body.name;
  var pwd=req.body.pwd;
  pool.query("insert into fanke_user values(null,?,?)",[name,pwd],(err,result)=>{
    if(err) throw err;
    if (result.affectedRows>0)
		{
			res.send({code:1,msg:'注册成功'});
		}
  })
})
router.post("/login",(req,res)=>{
  var name=req.body.name;
  var pwd=req.body.pwd;
  pool.query("select * from fanke_user where uname=? and upwd=?",[name,pwd],(err,result)=>{
    if(err) throw err;
    if (result.length>0){
      req.session.uid=result[0].uid
			res.send({code:1,msg:'登陆成功'});
		}else{
      res.send({code:-1,msg:"账号或密码错误"})
    }
  })
})
router.get("/check",(req,res)=>{
  var uid=req.session.uid;
  pool.query("select * from fanke_user where uid =?",[uid],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send(result)
    }else{
      res.send({code:-1})
    }
  })
});
module.exports=router