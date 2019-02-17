<template>
<div>
    <nav class="mui-bar mui-bar-tab">
        <router-link to="/" class="mui-tab-item mui-active">
            <span class="mui-icon mui-icon-home"></span>
            <span class="mui-tab-label">凡客</span>
        </router-link>
        <router-link to="fenlei" class="mui-tab-item">
            <span class="mui-icon mui-icon-extra mui-icon-extra-class"></span>
            <span class="mui-tab-label">分类</span>
        </router-link>
        <router-link to="pindao" class="mui-tab-item">
            <span class="mui-icon mui-icon-extra mui-icon-extra-classroom"></span>
            <span class="mui-tab-label">
            频道</span>
        </router-link>
      <router-link to="cart" class="mui-tab-item" >
		<span class="mui-icon mui-icon-extra mui-icon-extra-cart">
         <span class="mui-badge">{{$store.getters.getCount}}</span>
        </span>
		<span class="mui-tab-label">购物车</span>
      </router-link>
      <router-link to="login" class="mui-tab-item">
				<span class="mui-icon mui-icon-person-filled"></span>
				<span class="mui-tab-label">
        我的</span>
	  </router-link>
      </nav>
</div>
</template>
<script>
export default {
    data(){
        return{
            list:[]
        }
    },
    created() {
        this. getcount();
    },
    methods: {
        getcount(){
            this.axios.get("http://127.0.0.1:3000/cart").then(res=>{
                this.list=res.data
            })
        }
    },
    /*computed: {
        count(){
      return this.list.reduce(function(prev,elem){
        if(elem.selected){
          return prev+elem.count
        }else{
          return prev
        }
      },0)
    },
    }*/
}
</script>
<style>
    .mui-bar-tab .mui-tab-item-tao.mui-active {
    color: #007aff;
 }
.mui-bar-tab .mui-tab-item-tao {
    display: table-cell;
    overflow: hidden;
    width: 1%;
    height: 50px;
    text-align: center;
    vertical-align: middle;
    white-space: nowrap;
    text-overflow: ellipsis;
    color: #929292;
}
.mui-bar-tab .mui-tab-item-tao .mui-icon {
    top: 3px;
    width: 24px;
    height: 24px;
    padding-top: 0;
    padding-bottom: 0;
}

.mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
   font-size:11px;
   display:block;
   overflow:hidden;
   text-overflow:ellipsis;
}
.mui-bar-tab{
    background:#fff;
}
</style>