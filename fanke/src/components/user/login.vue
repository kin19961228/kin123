<template>
  <div class="app-mine">
    <div class="app-me" v-if="islogin">
      <div class="top-bg">
        <div class="set">
          <span class="mui-icon mui-icon-gear-filled"></span>
        </div>
        <div class="clear">
          <a>
            <img src="../../img/1.jpg">
          </a>
          <p>{{uname}}</p>
          <a>
            <img src="../../img/3.png">
          </a>
        </div>
        <ul> 
          <li>积分：15</li>
          <li>余额：0.00</li>
          <li>成长值：0</li>
        </ul>
      </div>
      <p>
        <a class="all">全部订单</a>
        <span class="mui-icon mui-icon-arrowright"></span>
      </p>
      <ul class="dingdan">
        <li>
          <a>
            <span class="mui-icon mui-icon-arrowright"></span>
            <br>
            <span>进行中</span>
          </a>
        </li>
        <li>
            <a>
              <span class="mui-icon mui-icon-checkmarkempty"></span>
              <br>
              <span>已完成</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon mui-icon-compose"></span>
              <br>
              <span>待评价</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon mui-icon-closeempty"></span>
              <br>
              <span>无效</span>
            </a>
        </li>

      </ul>
      <ul class="section-li">
        <li>
          <a>
            <span class="mui-icon-extra mui-icon-extra-gold"></span><br>
            <span>充值返现</span>
          </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-people"></span><br>
              <span>我的私人订制</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-express"></span><br>
              <span>物流查询</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-dictionary"></span><br>
              <span>退货记录</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-hotel"></span><br>
              <span>地址管理</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-gift"></span><br>
              <span>我的礼物卡</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-order"></span><br>
              <span>我的优惠券</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-gold"></span><br>
              <span>我的积分</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon mui-icon-chat"></span><br>
              <span>我的评论</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon-extra mui-icon-extra-xiaoshuo"></span><br>
              <span>我的提问</span>
            </a>
        </li>
        <li>
            <a>
              <span class="mui-icon mui-icon-email"></span><br>
              <span>投诉建议</span>
            </a>
        </li>
      </ul>
      <nav-box></nav-box>
    </div>
    <div class="app-login" v-else>
      <header class="mui-bar mui-bar-nav">
        <router-link to="/home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
        <h1 class="mui-title">登陆</h1>
      </header>
      <form class="mui-input-group">
            <div class="mui-input-row">
              <label>用户名</label>
              <input type="text" v-model="name" placeholder="请输入账号">
            </div>
            <div class="mui-input-row">
              <label>密码</label>
              <input type="password" v-model="pwd" placeholder="请输入密码">
            </div>
      </form>
      <div class="login">
      <mt-button size="large" @click="login">登 录</mt-button>
      <div class="register">
        <router-link to="register">免费注册</router-link>
      <a >手机账号取回密码</a>
      </div>
      </div>
    </div>
    
  </div>
  
</template>
<script>
import {Toast} from "mint-ui"
import bar from '../sub/bar.vue'
export default {
  data(){
    return{
      name:"",
      pwd:"",
      islogin:false,
      uname:""
    }
  },
  components:{
    "nav-box":bar
  },
  created() {
    this.check();
  },
  methods:{
    login(){
      let postData=this.qs.stringify({
          name:this.name,
          pwd:this.pwd,
        });
        this.axios({
          method:"post",
          url:"http://127.0.0.1:3000/user/login",
          data:postData
        }).then(res=>{
          this.$store.commit("updateCount")
          Toast(res.data.msg);
          this.$router.push("")
        })
    },
    check(){
      this.axios.get("http://127.0.0.1:3000/user/check").then(res=>{
        if(res.data.code==-1){
          this.islogin=false;
        }else{
          this.uname=res.data[0].uname
          this.islogin=true;
        }
      })
    }
  }
}
</script>
<style>
  .app-login form{
    margin-top: 70px;
  }
  .login{
    width: 80%;
    margin: 30px auto
  }
  .register{
    margin-top: 10px;
    display: flex;
    justify-content: space-between
  }
  .login a{
    font-size: 14px;
    color:#b8bbbf;
  }
.mint-button--default {
    color:#f6f8fa;
    background-color: #b81b22;
    -webkit-box-shadow: 0 0 1px #b8bbbf;
    box-shadow: 0 0 1px #b8bbbf;
}
.app-mine div.set span{
  float: right;
  margin-top: 5px;
  margin-right: 10px;
}
.app-me>.top-bg{
  height:13rem;
  background: url("../../img/2.png") no-repeat center top;
  background-size: cover;
}
.clear{
  clear: both;
  text-align: center;
}
.clear a:first-child img{
  border-radius: 50%;
}
.clear a:last-child img{
  height:18px;
}
.clear p{
  color:black;
  margin: 0;
}
.top-bg ul{
  list-style: none;
  display: flex;
  justify-content: space-around;
  color:white;
  font-size: 0.5rem;
  margin: 0;
}
.app-me p{
  margin: 0;
  margin-top: 0.8rem;
  padding: 0;
}
.app-me p span{
  float: right;;
}
.all{
  padding: 0 0.9em;
  color:black;
  margin-top: 0.5rem;
}
ul.dingdan{
  text-align: center;
  width: 100%;
  list-style: none;
  padding: 0;
  margin: 0;
  margin-top: 0.7rem;
  display: flex;
  justify-content: space-around;
  font-size: 0.6rem;
}
ul.dingdan li a{
  color: black;
}
.section-li{
  text-align: center;
  width: 100%;
  list-style: none;
  padding: 0;
  margin: 0;
  margin-top: 2rem;
  font-size: 0.8rem;
}
.section-li li{
  width:25%;
  float: left;
  margin-bottom: 1.5rem;
}
.section-li li a{
  color: black
}
</style>
