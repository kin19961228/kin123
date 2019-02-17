<template>
  <div class="app-register">
    <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">注册</h1>
		</header>
    <form class="mui-input-group">
					<div class="mui-input-row">
						<label>用户名</label>
						<input type="text" v-model="name" placeholder="请输入账号">
					</div>
          <div class="mui-input-row">
						<label>密码</label>
						<input type="password" v-model="pwd1" placeholder="请输入密码">
					</div>
          <div class="mui-input-row">
						<label>确认密码</label>
						<input type="password" v-model="pwd2" placeholder="请确认密码">
					</div>
          <p>注册账号即表示同意遵守<a>《VANCL凡客服务条款》</a></p>
    </form>
    <mt-button size="large" @click="register">点击注册</mt-button>
  </div>
</template>
<script>
import {Toast} from "mint-ui"
export default {
  data(){
    return{
      name:"",
      pwd1:"",
      pwd2:""
    }
  },
  methods:{
    register(){
      var pwd1=this.pwd1;
      var pwd2=this.pwd2;
      if(pwd1==pwd2){
        let postData=this.qs.stringify({
          name:this.name,
          pwd:this.pwd1,
        });
        this.axios({
          method:"post",
          url:"http://127.0.0.1:3000/user/register",
          data:postData
        }).then(res=>{
          Toast(res.data.msg)
        })
      }else{
        Toast("请确认两次密码一致")
      }
    }
  },

}
</script>
<style>
  p{
    margin:30px;
  }
  p a{
    color: black
  }
  .app-register form{
    margin-top: 70px;
  }
  .mint-button--large {
    display: block;
    width: 80%;
    margin: 0 auto
}
.mint-button--default {
    color:#f6f8fa;
    background-color: #b81b22;
    -webkit-box-shadow: 0 0 1px #b8bbbf;
    box-shadow: 0 0 1px #b8bbbf;
}
</style>
