<template>
    <div class="app-details">
       <header class="mui-bar mui-bar-nav">
			<router-link to="shangwu" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title">商品详情</h1>
	   </header>
       <mt-swipe :auto="2500">
            <mt-swipe-item v-for="(item,i) of swipelist[index]" :key="i">
            <img :src="item" />
            </mt-swipe-item>
        </mt-swipe>
        <div class="details">
            <span>{{title}}</span><br>
            <span class="through">{{price}}</span>
            <span class="red big">{{parseInt(price*0.75)}}</span><br>
            <a><span class="red">充100返100，点击充值</span></a><br>
            <span class="red">充值购买更优惠</span>
            <div class="line"></div>
            <span class="bgred">免邮</span>
            <span>全场购物满199元免运费 </span>
        </div>
        <div class="size" @click="show">
            <span>{{info}}</span>
        </div>
        <div v-show="click">
            <div class="size">
                <p>选择颜色</p>
                <span class="size-color" @click="chose(p,i)" v-for="(p,i) of colors" :class="{'active':i==index}">{{p}}</span>
            </div>
            <div class="size">
                <p>尺码选择</p>
                <span class="size-spec" @click="chosespec(p, i)" v-for="(p,i) of spec[index]" :class="{'active':i===index1}">{{p}}</span>
            </div>
            <div class="size">
                <p>购买数量</p>
                <span class="prev" @click="sub">-</span>
                <span class="count">{{count}}</span>
                <span class="next" @click="add">+</span>
            </div>
        </div>
        <mt-navbar v-model="selected">
                <mt-tab-item id="1">商品详情</mt-tab-item>
                <mt-tab-item id="2">评论</mt-tab-item>
                <mt-tab-item id="3">咨询</mt-tab-item>
            </mt-navbar>
            <!-- tab-container -->
            <mt-tab-container v-model="selected">
                <mt-tab-container-item id="1">
                    <div v-for="p of dimgs">
                        <img :src="p" alt="">
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="2">
                    <div class="pl">
                        <div class="user">
                            <span class="name">来自:1353***</span>
                            <span class="date">2019/1/12 12:13:09</span>
                        </div>
                        <p class="cont">没有之前买的厚，现在的款有点薄，不过一直喜欢，性价比非常棒！</p>
                    </div>
                    <div class="pl">
                        <div class="user">
                            <span class="name">来自:1353***</span>
                            <span class="date">2019/1/12 12:13:09</span>
                        </div>
                        <p class="cont">没有之前买的厚，现在的款有点薄，不过一直喜欢，性价比非常棒！</p>
                    </div>
                    <div class="pl">
                        <div class="user">
                            <span class="name">来自:1353***</span>
                            <span class="date">2019/1/12 12:13:09</span>
                        </div>
                        <p class="cont">没有之前买的厚，现在的款有点薄，不过一直喜欢，性价比非常棒！</p>
                    </div>
                    <div class="pl">
                        <div class="user">
                            <span class="name">来自:1353***</span>
                            <span class="date">2019/1/12 12:13:09</span>
                        </div>
                        <p class="cont">没有之前买的厚，现在的款有点薄，不过一直喜欢，性价比非常棒！</p>
                    </div>
                </mt-tab-container-item>
                <mt-tab-container-item id="3">
                        <div class="zixun">
                            <span>我要咨询</span>
                            <textarea placeholder="您输入的字数不要超过60个字" maxlength="60"></textarea>
                            <mt-button size="large">提交</mt-button>
                        </div>
                        <div class="pl">
                            <p class="question">问:你好，有加绒的衬衫吗</p>
                            <div class="user">
                                <span class="name">来自:1353***</span>
                                <span class="date">2019/1/12 12:13:09</span>
                            </div>
                            <p class="cont">没有之前买的厚，现在的款有点薄，不过一直喜欢，性价比非常棒！</p>
                        </div>
                </mt-tab-container-item>
        </mt-tab-container>
        <div class="nav">
        <a class="mui-tab-item" >
            <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
                <span class="mui-badge">{{$store.getters.getCount}}</span>
            </span>
        </a>
        <span class="addcart" @click="addcart">
            加入购物车
        </span>
        </div>
    </div>
</template>
<script>
import {Toast} from 'mint-ui'
export default {
    data(){
        return{
            swipelist:[[],[]],
            title:"",
            price:"",
            click:false,
            selected:"1",
            dimgs:[],
            spec:[[],[]],
            colors:[],
            index:0,
            index1:"",
            info:"选择 颜色/尺码",
            activeColor: '',
            activeSize: '',
            count:1
        }
    },methods: {
        getdetails(){
            var pid=this.$route.query.pid;
            this.axios.get("http://127.0.0.1:3000/product/details?pid="+pid).then(res=>{
                console.log(res.data)
                this.swipelist[0]=JSON.parse(res.data.details[0].cimgs);
                this.swipelist[1]=JSON.parse(res.data.details[1].cimgs);
                console.log(this.swipelist)
                this.title=res.data.details[0].title;
                this.price=res.data.details[0].price;
                console.log(res.data.details_img[0].imgs)
                var str1=res.data.details_img[0].imgs
                //console.log(srt1)
                this.dimgs=JSON.parse(str1)
                this.spec[0]=JSON.parse(res.data.spec[0].spec)
                this.spec[1]=JSON.parse(res.data.spec[1].spec)
                for(var i of res.data.spec){
                    this.colors.push(i.color)
                }
                
            })
        },
        show(){
            if(this.click){
                this.click=false;
            }else{
                this.click=true;
                this.activeColor = this.colors[0];
                this.info="已选："+this.activeColor;
                if (this.activeSize) {
                   this.info += ","+this.activeSize;
                }
            }
        }, 
        chose(p, i){
            this.index1='';
           this.activeSize = '';
          this.index=i;
          this.activeColor = p;
          this.info="已选："+this.activeColor;
         
        },
        chosespec(p, i){
          this.index1=i;
          this.activeSize = p;
          this.info = "已选："+this.activeColor + ","+this.activeSize;    
        },
        add(){
            this.count++;
        },
        sub(){
            if(this.count>1){
                this.count--
            }
        },
        addcart(){
            var pid=this.$route.query.pid;
            var spec=document.querySelector("span.size-spec.active")
            if(spec==null){
                Toast("请选择颜色和尺码")
                return;
            }else{
                spec=spec.innerHTML;
                console.log(spec)
            }
            var color=document.querySelector("span.size-color.active").innerHTML
            var price=document.querySelector("span.red.big").innerHTML;
            var count=this.count
            console.log(pid,spec,color,price,count)
            this.axios.get("http://127.0.0.1:3000/cart/add",{
                params:{
                    pid,
                    spec,
                    color,
                    price,
                    count
                }
            }).then(res=>{
                this.$store.commit("updateCount")
                Toast(res.data.msg)
            })
        }
    },
    created() {
        this.getdetails();
    },
}
</script>
<style>
    div.size::after{
        content: "";
        display: block;
        clear: both;
    }
  .app-details{
      margin-bottom: 70px;
  }
  .mint-swipe{
    height:300px;
    margin-top: 44px;
  }
  .mint-swipe img{
     height:298px;
         padding: 0.5em 2.5em 0 2.5em;
  }
  .details{
      width:80%;
      margin: 0 auto;
      font-size: 0.8rem
  }
  .red{
      color:red;
  }
  .big{
    font-size: 1rem
  }
  .through{
      text-decoration: line-through;
      color:red;
  }
  .line{
    display: block;
    border-bottom: 1px solid #ccc;
    height: 1px;
  }
  .bgred{
    color: #fff;
    border-radius: 0.15em;
    margin-right: 5px;
    padding: 0.1em;
    background: #b81c22;
  }
  .size{
    background: #f5f5f5;
    margin: .9em 2em;
    padding: .8em .8em;
    cursor: pointer;
    font-size: 0.6rem
  }
  .size-color,.size-spec{
    float: left;
    border: .1em solid #b3b3b3;
    border-radius: .1em;
    margin-right: .5em;
    margin-bottom: .5em;
    padding: .5em .8em;
  }
  p{
      clear: both;
  }
  .active{
    border-color: #b81c20;
  }
  .mint-navbar .mint-tab-item.is-selected{
      color: #b81c20;
      border-bottom: 0;
  }
  .app-details a{
      color:black
  }
  .app-details .mint-navbar{
      border-bottom: 1px solid black
  }
  .mint-tab-container-item img{
      width:100%;
  }
  div.pl{
      width: 80%;
      margin: 10px auto;
      border-bottom: 1px dotted gray;
  }
  div.pl p{
      margin-top:5px;
      margin-bottom: 0;
  }
  .name{
      float: left;
  }
  .date{
      float: right;
  }
  div.user::after{
      content: "";
      display: block;
      clear: both;
  }
  p.question{
      color:red;
      margin-bottom:5px !important
  }
  div.zixun{
    background: #e3e3e3;
    margin-bottom: 1em;
    padding: .5em 2em;
  }
  div.zixun span{
      color:black;
      font-size: 14px;
  }
  textarea{
      height: 6rem;
      padding: 0
  }
  .mint-button--default {
    color: #f6f8fa;
    background-color: red;
    -webkit-box-shadow: 0 0 1px #b8bbbf;
    box-shadow: 0 0 1px #b8bbbf;
}
.prev,.next,.count{
    font-size: 16px;
    border: 1px solid black;
    display: inline-block;
    text-align: center;
    line-height: 24px;
    width:24px;
    height:24px;
}
.count{
    font-size: 14px;
}
.nav{
    position: fixed;
    bottom: 0;
    height:36px;
    width:100%;

}
.nav a{
    float: left;
    width:50%;
    text-align: center;
    background: white;
    height:100%;
    line-height: 45px;
}
.app-details .mui-icon .mui-badge {
left:27.5%;
top:0px;
}
.addcart{
    float: left;
    height:36px;
    width:50%;
    text-align: center;
    line-height: 36px;
    background: #b81c20;
    font-size: 14px;
    color:white;
}

  
</style>