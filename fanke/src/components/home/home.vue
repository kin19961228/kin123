<template>
    <div id="app-home">
        <div class="header">
            <form>
                <img src="../../img/index/search2.png" alt="">
                <input type="text" placeholder="熊本熊" class="myinput">
            </form>
            <a>
                <span>...</span>
            </a>
        </div>
        <mt-swipe :auto="2500">
            <mt-swipe-item v-for="item of swipelist" :key="item.id">
            <img :src="item.img" />
            </mt-swipe-item>
        </mt-swipe>
        <div class="nav">
            <a class="disb">
                <img src="http://127.0.0.1:3000/01.jpg" >
            </a>
            <div class="nav-label">
                <a v-for="p of navlist"><img :src="p.img">
                <span>{{p.title}}</span>
                </a>
            </div>
        </div>
        <div class="second-kill">
            <div class="skill-head">
                <div class="skill-left">
                    <span>每日秒杀</span>
                    <span class="gray">| 23点场</span>
                </div>
                <div class="skill-right">
                    <span class="gray">据开始</span>
                    <span class="time">{{h}}</span>:
                    <span class="time">{{m}}</span>:
                    <span class="time">{{s}}</span>
                </div>
            </div>
            <div class="ullist">
                 <ul class="secondimg">
                <li class="swipe" v-for="p of secondlist">
                    <a>
                        <img :src="p.img">
                        <span class="spanl">充值后￥{{(p.price*0.4).toFixed(0)}}</span>
                        <span class="spanr">{{p.price}}</span>
                    </a>
                </li>
                </ul>
            </div>
                <div class="killfoot">
                <span>限时特惠 欲购从速</span>
            </div>  
        </div>  
        <h5>
            <span>凡客T恤之猪年大吉</span>
        </h5>
        <mt-swipe :show-indicators="false">
            <mt-swipe-item v-for="p of swipelist2" :key="p.id">
                <a>
                    <img :src="p.img" >
                </a>
            </mt-swipe-item>
        </mt-swipe>
        <h5>
            <span>年货节 全场直降</span>
        </h5>
        <nav-box></nav-box>
    </div>
</template>
<script>
import bar from '../sub/bar.vue'
export default {
    data(){
        return{
            swipelist:[],
            swipelist2:[],
            navlist:[],
            h:0,
            m:0,
            s:0,
            secondlist:[],
        }
    },
     components:{
        "nav-box":bar
    },
    methods:{
        swipeimg(){
            this.axios.get("http://127.0.0.1:3000/index").then(res=>{
               // console.log(res.data)
                this.swipelist=res.data
                
            })
        },
        swipeimg2(){
            this.axios.get("http://127.0.0.1:3000/index/2").then(res=>{
               // console.log(res.data)
                this.swipelist2=res.data
                
            })
        },
        navimg(){
            this.axios.get("http://127.0.0.1:3000/index/navimg").then(res=>{
                this.navlist=res.data
            })
        },
        countTime: function () {
                //获取当前时间
                var date = new Date();
                var now = date.getTime();
                //设置截止时间
                var year=date.getFullYear();
                var month=date.getMonth()+1;
                var date1=date.getDate();
                var hour=date.getHours();
                if(hour>=23){
                    date1=date1+1
                }
                var endDate = new Date(`${year}-${month}-${date1} 23:00:00`);
                var end = endDate.getTime();
                //时间差
                var leftTime = end - now;
                //定义变量 d,h,m,s保存倒计时的时间
                if (leftTime >= 0) {
                    //d = Math.floor(leftTime / 1000 / 60 / 60 / 24);
                    this.h = Math.floor(leftTime / 1000 / 60 / 60 % 24);
                    this.m = Math.floor(leftTime / 1000 / 60 % 60);
                    this.s = Math.floor(leftTime / 1000 % 60);
                }
                if(this.h<10){
                    this.h="0"+this.h
                }
                if(this.m<10){
                    this.m="0"+this.m
                }
                if(this.s<10){
                    this.s="0"+this.s
                }
                //递归每秒调用countTime方法，显示动态时间效果
                setTimeout(this.countTime, 1000);
            },
        getsecond(){
            this.axios.get("http://127.0.0.1:3000/index/second").then(res=>{
                this.secondlist=res.data;
                console.log(this.secondlist)
            })
        }    
    },
    created(){
        this.swipeimg();
        this.swipeimg2();
        this.navimg();
        this.countTime();
        this.getsecond();
    }
    
}
</script>
<style>
    .header{
        width:100%;
        height:3rem;
        position: fixed;
        background: -webkit-linear-gradient(rgba(209, 207, 207, 1), rgba(190, 92, 92, 0.2));
        z-index: 999;
    }
    .header:after{
         content:"";
        display:block;
        clear:both
    }
    .header form{
        position: absolute;
        left: 0.9rem;
        top: 50%;
        transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        width: 85%;
        height: 1.7rem;
        line-height: 2.9rem;
        background-color: #fff;
        border: 1px solid #aaaaaa;
        border-radius: 3rem;
        overflow: hidden;
    }
    .header input.myinput{
        font-size: 12px;
        position: absolute;
        left: 2.3rem;
        top: 50%;
        transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        width: 85%;
        height: 85%;
        display: inline-block;
        border: 0 none;
        vertical-align: middle;
        margin: 0;
        padding: 0;
    }
    form img{
        width:18px !important;
        position: absolute;
        top:0.2rem;
        left:0.5rem;
    }
    .header a{
        position: absolute;
        top: 50%;
        right: 0.8rem;
        transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        width: 1.5rem;
        height:1.1rem;
        line-height: 0.8rem;
        display: inline-block;
        text-align: center;
        color: #aaa;
        border: 1px solid #aaa;
        border-radius: 6px;
        cursor: pointer;
    }
    .header a span{
        line-height: 0.8rem
    }
    #app-home .mint-swipe{
    height:200px;
    }
    #app-home div.nav{
        padding:1rem;
    }
    div.nav::after{
        content: "";
        display: block;
        clear: both;
    }
    .disb{
        display: block
    }
    #app-home img{
        width:100%;
    }
    .nav-label img{
        width: 2.2rem;
    }
    .nav-label a{
        text-align: center;
        padding: 0.5rem;
        float: left;
        width:20%;
    }
    .nav-label a span{
        display:inline-block;
        font-size: 0.8rem;
        color:black
    }
    .skill-head{
        padding: 1rem;
    }
    .skill-head::after{
        content: "";
        display: block;
        clear: both;
    }
    .skill-left{
        float: left;
        font-size: 0.8rem;
    }
    .skill-right{
        float:right;
        font-size: 0.8rem;
    }
    .gray{
        color:gray;
    }
    .time{
        background:red;
        color:white;
        margin:0 2px;
        padding:0.1rem;
    }
    .ullist{
        width: 100%;
        height:147px;
    }
    ul.secondimg{
        width:100%;
        height: 100%;
        list-style: none;
        margin: 0;
        padding: 0;
        white-space: nowrap;
        overflow-x:auto;
        max-width:2000px;
    }
    li.swipe{
        display:inline-block;
        width:25%;
        height:100%;
        margin-right: 6px;
    }
    li:after{
        content:"";
        display:block;
        clear:both;
    }
    a{
        text-decoration: none;
        font-size: 12px;
        color: black
    }
    li.swipe a {
        display: block;
        height:100%;
    }
    li.swipe a img{
        width:100%;
    }
    .spanl{
        float: left;
        color:red;
    }
    .spanr{
        float: right;
        color: gray;
        text-decoration:line-through;
    }
    .killfoot{
        text-align: center;
        color:red;
    }
    body{
        font-size: 12px;
    }
    h5{
        padding: 0 2rem;
    }
    #app-home{margin-bottom: 50px;}
</style>