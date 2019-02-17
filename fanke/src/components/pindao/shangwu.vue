<template>
  <div class="app-shangwu">
    <header class="mui-bar mui-bar-nav">
			<router-link to="pindao" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title" >商务衬衫</h1>
		</header>
    <mt-swipe :auto="2500">
            <mt-swipe-item v-for="item of swipelist" :key="item.id">
            <img :src="item.img" />
            </mt-swipe-item>
    </mt-swipe>
    <img src="../../img/2018_4_26_16_10_27_8839.jpg" alt="">
    <img src="../../img/2017_10_17_10_50_22_8537.jpg" alt="">
    <ul>
      <li v-for="p of productlist">
        <router-link :to="'details?pid='+p.pid">
          <img :src="p.img">
          <p>{{p.title}}</p>
          <span>特惠价￥{{p.price}}</span>
        </router-link>
      </li>
    </ul>
    <nav-box></nav-box>
  </div>
</template>
<script>
import bar from '../sub/bar.vue'
export default {
  data(){
    return{
      swipelist:[],
      productlist:[],
    }
  },
  components:{
        "nav-box":bar
  },
  methods:{
    getproduct(){
      this.axios.get("http://127.0.0.1:3000/pindao/shangwu").then(res=>{
        console.log(res.data)
        this.productlist=res.data
      })
    },
    getimg(){
      this.axios.get("http://127.0.0.1:3000/pindao/lunbo").then(res=>{
        this.swipelist=res.data
      })
    },

  },
  created(){
    this.getproduct();
    this.getimg()
  }
}
</script>
<style scoped>
  .app-shangwu{
    margin-bottom: 50px;
  }
  .app-shangwu::after{
    content: "";
    display: block;
    clear: both;
  }
  .mint-swipe{
      height:181px;
      margin-top: 44px;
  }
  img{
    width:100%
  }
  .app-shangwu ul{
    width: 100%;
    list-style: none;
    padding: 0
  }
  .app-shangwu ul li{
    padding:0 0.5rem 0 1rem;
    width:48%;
    float: left;  
  }
  .app-shangwu ul li p{
    text-align: center;
    color: #4C4C4C;
    height: 1.05em;
    line-height: 1.05em;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    margin-top: 0.6em;
    font-size: 12px;
  }
   .app-shangwu ul li span{
         display: block;
    color: #B81B22;
    text-align: center;
    line-height: 0.9em;
    height: 0.9em;
    margin: 0.7em auto;
    font-size: 12px;
   }

</style>
