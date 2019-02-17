const express=require('express');
//引入body-parser中间件
const bodyParser=require('body-parser');
const session = require("express-session");
const indexrouter=require('./routes/index');
const productrouter=require('./routes/product');
const pindaorouter=require('./routes/pindao');
const userrouter=require('./routes/user');
const cartrouter=require('./routes/cart');
const cors = require("cors");
//2:配置cors
var app=express();
app.listen(3000);
app.use(cors({
  origin:["http://127.0.0.1:8080",
         "http://localhost:8080"],//允许列表
  credentials:true   //是否验证
}))
app.use(express.static('public'));
app.use(session({
  secret:"128位随机字符串",   //安全令牌
  resave:false,              //请求保存
  saveUninitialized:true,    //初始化
  cookie:{                   //sessionid保存时
    maxAge:1000*60*60*24     //间1天 cookie
  }
}));
app.use(bodyParser.urlencoded({
  extended:false //不使用扩展的模块，而是使用nodejs提供的querystring模块解析为对象
}));
app.use("/index",indexrouter);
app.use("/product",productrouter);
app.use("/pindao",pindaorouter);
app.use("/user",userrouter);
app.use("/cart",cartrouter);