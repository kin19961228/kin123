<template>
  <div class="app-fenlei">
    <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">频道</h1>
		</header>
    <div class="lists">
      <div class="list" v-for="p of list">
        <router-link to="shangwu">
          <img :src="p.img" >
        </router-link>
      </div>
    </div>
    <nav-box></nav-box>
  </div>
</template>
<script>
import bar from '../sub/bar.vue'
export default {
  data(){
    return{
      list:[]
    }
  },
   components:{
        "nav-box":bar
  },
  methods:{
    getlist(){
      this.axios.get("http://127.0.0.1:3000/pindao").then(res=>{
        this.list=res.data
        console.log(this.list)
      })
    }
  },
  created(){
    this.getlist()
  }
}
</script>
<style>
  .app-fenlei div.lists{
     margin-top: 50px;
  }
  .app-fenlei div.list{
    width:100%;
  }
   .app-fenlei div.list img{
     width:100%;
   }
</style>


