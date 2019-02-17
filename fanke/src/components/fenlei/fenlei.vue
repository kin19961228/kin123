<template>
    <div class="app-fenlei">
        <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">分类</h1>
		</header>
		<div class="mui-content mui-row mui-fullscreen">
			<div class="mui-col-xs-3">
				<div id="segmentedControls" class="mui-segmented-control mui-segmented-control-inverted mui-segmented-control-vertical">
                <a v-for="(p,i,key) of list" class="mui-control-item mui" :class="{'mui-active':i==index}"  @click="addclass(i)" :key=key>{{p}}</a>
				</div>
			</div>
			<div id="segmentedControlContents" class="mui-col-xs-9" style="border-left: 1px solid #c8c7cc;">
				<div :class="{'mui-active':0==index}" class="mui-control-content">
                    <ul>
                        <li class="productlist" v-for="p of man" :key="p.id">
                            <img :src="p.img">
                            <span>{{p.title}}</span>
                        </li>
                    </ul>
				</div>
				<div :class="{'mui-active':1==index}" class="mui-control-content">
                    <ul>
                        <li class="productlist" v-for="p of woman" :key="p.id">
                            <img :src="p.img">
                            <span>{{p.title}}</span>
                        </li>
                    </ul>
				</div> 
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
            list:["男装","女装","男鞋","女鞋","补品","家居","童装","内衣"],
            man:[],
            woman:[],
            index:0,
        }
    },
     components:{
        "nav-box":bar
    },
    methods:{
        getman(){
            this.axios.get("http://127.0.0.1:3000/product/man").then(res=>{
                this.man=res.data;
            })
        },
        getwoman(){
            this.axios.get("http://127.0.0.1:3000/product/woman").then(res=>{
                this.woman=res.data;
            })
        },
        addclass(i){
          this.index=i;
        }
    },
    created(){
        this.getman();
        this.getwoman();
    }
}
</script>
<style>
    .app-fenlei{
        font-size: 12px;
    }
    div.mui-content{
        margin-bottom: 50px;
    }
    .mui-row.mui-fullscreen>[class*="mui-col-"] {
            height: 100%;
        }
        .mui-col-xs-3,
        .mui-control-content {
            overflow-y: auto;
            height: 100%;
        }
        .mui-segmented-control .mui-control-item {
            width: 100%;
        }
        .mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
            background-color: #fff;
        }
        ul{
            list-style: none;
            padding: 0;
        }
        ul::after{
            content: "";
            clear: both;
            display: block;
        }
        .productlist{
            width:33%;
            float: left;
            text-align: center
        }
        .productlist img{
            width: 75%;
            display: block;
            margin: 0.5rem auto;
        }
        .mui-col-xs-3{
            background:#e5e5e5;
        }
        .mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active{
            color:red;
        }
</style>