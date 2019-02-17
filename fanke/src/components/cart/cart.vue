<template>
  <div class="app-cart"> 
    <header class="mui-bar mui-bar-nav">
			<router-link to="/home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">购物车</h1>
    </header>
    <div class="cart-main">
      <div class="cart-top">
        <span>在售商品</span>
        <input type="button" @click="del()" value="删除">
        <input type="button"  v-model="checkAll" @click="change($event)">
      </div>
      <div class="car-list" v-for="(p,i) of list">
          <input type="checkbox" v-model="checklist[i]" :data-id="p.id" @click="check($event)">
          <a>
            <img :src="p.img">
          </a>
          <div class="details">
            <p>{{p.title}}</p>
              <span class="spec">颜色：{{p.color}} 尺码：{{p.spec}}</span>
            <p class="num">
            <span class="price">￥{{p.price}}</span>
            <span class="sub" @click="sub(p.count,p.id)">-</span>
            <span class="count">{{p.count}}</span>
            <span class="add" @click="add(p.count,p.id)" >+</span>
          </p>
          </div>
      </div>
    </div>
    <div class="total">
      <div class="left">
        <p><span>需支付￥{{total}}</span></p>
      <span>总金额￥{{total}}已优惠0.00</span>
      </div>
      <a class="pay">
        <span>结算（{{count}}）</span>
      </a>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],
      checklist:[],
      checkAll:"全不选",
      listid:[],
    }
  },methods: {
    checklogin(){
      this.axios.get("http://127.0.0.1:3000/user/check").then(res=>{
        if(res.data.code==-1){
          this.$router.push("/login")
        }
      })
    },
    getcart(){
      this.axios.get("http://127.0.0.1:3000/cart").then(res=>{
        this.list=res.data
        this.checklist=[];
        this.listid=[];
        console.log(this.checklist)
        for(var p of res.data){
          if(p.selected==1){
            p.selected=true;
          }else{
            p.selected=false
          }
          this.checklist.push(p.selected)
          console.log(this.checklist)
        }
        for(var p of res.data){
          if(p.selected){
            this.listid.push(p.id)
          }
        }
      })
    },
    change(e){
      this.$store.commit("updateCount")
      var bool
     if(e.target.value=="全不选"){
       this.checkAll="全选";
       this.checklist.forEach(function(elem,i,arr){
         arr[i]=false;
       })
       bool=0
     }else{
       this.checkAll="全不选";
       this.checklist.forEach(function(elem,i,arr){
         arr[i]=true;
       })
      bool=1
     }
     this.axios.get("http://127.0.0.1:3000/cart/updateAllSelected?bool="+bool).then(res=>{
       this.getcart();
     })
    },
    check(e){
      var selected=e.target.checked;
      var id=parseInt(e.target.getAttribute("data-id"));
      this.axios.get("http://127.0.0.1:3000/cart/updateSelected?selected="+selected+"&id="+id).then(res=>{
          this.getcart();
      })
    },
    add(count,id){
      this.$store.commit("updateCount")
      count++;
      console.log(count)
      this.axios.get("http://127.0.0.1:3000/cart/updatecount?count="+count+"&id="+id).then(res=>{
        if(res.data.code>0){
          this.getcart();
        }
      })
    },
    sub(count,id){
      this.$store.commit("updateCount")
      if(count>1){
        count--;
        this.axios.get("http://127.0.0.1:3000/cart/updatecount?count="+count+"&id="+id).then(res=>{
        if(res.data.code>0){
        this.getcart();
        }
      })
      }
     
    },
    del(){
      var id=this.listid.join(",")
      if(id.length>0){
        console.log(111)
        this.$store.commit("updateCount")
        this.axios.get("http://127.0.0.1:3000/cart/del?id="+id).then(res=>{
          this.getcart();
      })
      }
      
    }
  },
  watch: {
    checklist(){
      this.$store.commit("updateCount")
      console.log(this.checklist)
      if(this.checklist.every(function(elem){return elem})){
        this.checkAll="全不选"
      }else{
        this.checkAll="全选"
      }
    },
  },
  created() {
    this.checklogin();
    this.getcart();
  },
  computed: {
    total(){
      return this.list.reduce(function(prev,elem){
        console.log(elem.selected)
        if(elem.selected){
          return prev+(elem.price*elem.count)
        }else{
          return prev
        }
      },0)
    },
    count(){
      return this.list.reduce(function(prev,elem){
        if(elem.selected){
          return prev+elem.count
        }else{
          return prev
        }
      },0)
    }
  },
}
</script>
<style>
  .app-cart div.cart-main{
    padding: 0em 2em;
  }
  .app-cart div.cart-top{
    margin-top: 44px;
    font-size: 12px;
    padding:0.3rem 0;
    border-bottom: 1px solid #e3e3e3;
  }
  .app-cart div.cart-top input{
    float: right;
    width:2.5rem;
    padding:0.2rem 0;
    margin-left: 1rem;
    background: #b81822;
    color:white;
    font-size: 12px;
  }
  .app-cart div.cart-top input disabled{
    background: #FFF;
  }
  .app-cart div.car-list{
    position: relative;
    margin-top:6px;
  }
  .app-cart div.car-list::after{
    content: "";
    clear: both;
    display: block;
  }
  .app-cart div.car-list input{
    position: absolute;
    display: block;
    width:20px;
    height:20px;
    top: 45%;
    left:-1rem
  } 
  .app-cart div.car-list img{
    float: left;
    vertical-align: top;
    width: 4.5em;
    height: 4.5em;
    margin-right: 0em;
    margin-left: 1em;
  }
  p{
    margin: 0;
    padding: 0
  }
  .app-cart .details{
    float: left;
    padding-left: 1rem
  }
  .app-cart .spec{
    font-size: 12px;
  }
  .app-cart p.num{
    margin-top: 0.5rem;
  }
  .app-cart span.price{
    color:red;
  }
  .app-cart span.sub,.app-cart span.add,.app-cart span.count{
    font-size: 18px;
    border: 1px solid #e3e3e3;
    padding: 0.1rem 0.5rem;
    margin-left: 0.5rem;
    border-radius: 4px;
  }
  .total{
    padding: 0.5rem 0;
    max-width: 640px;
    width: 100%;
    position: fixed;
    bottom: 0;
    z-index: 9;
    background-color: #f5f5f5;
    border-top: 1px solid #999;
    font-size: 12px;
  }
  .total p{
    font-size: 12px;
  }
  .total span{
    padding-left: 1.5rem;
  }
  .left{
    float: left;
  }
  .app-cart div.total a.pay{
    display: block;
    position: absolute;
    background: #b81822;
    text-align: center;
    color: #fff;
    font-size: 18px;
    right:5%;
    top:18%;
  }
  .app-cart div.total a.pay span{
    display: block;
    padding: 0.5rem 1.2rem;
  }
  .noid{
    background:#333;
  }
</style>
