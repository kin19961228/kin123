// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

import './lib/mui/css/mui.css';
import'mint-ui/lib/style.css';
import './lib/mui/css/icons-extra.css';
Vue.config.productionTip = false
import qs from "qs";
Vue.prototype.qs=qs;
import axios from "axios"
//5:修改配置信息 跨域保存session值!!!!
axios.defaults.withCredentials=true
//6:注册组件
Vue.prototype.axios = axios
import {Header,Swipe,SwipeItem,Button} from "mint-ui";
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);
import { Navbar, TabItem } from 'mint-ui';
import { TabContainer, TabContainerItem } from 'mint-ui';
Vue.component(TabContainer.name, TabContainer);
Vue.component(TabContainerItem.name, TabContainerItem);
Vue.component(Navbar.name, Navbar);
Vue.component(TabItem.name, TabItem);

import Vuex from 'vuex';
Vue.use(Vuex)
var store=new Vuex.Store({
  state:{cartCount:0},//购物车中商品的数量
  mutations:{            
    updateCount(state){
      axios.get("http://127.0.0.1:3000/cart").then(res=>{
        var count=res.data.reduce(function(prev,elem){
          if(elem.selected){
            console.log(elem.count)
            console.log(prev)
            return prev+elem.count
          }else{
            return prev
          }
        },0)
        console.log(count)
        state.cartCount=count
        console.log(state.cartCount)
      })
    }
  },
  getters:{
    getCount:function(state){
      return state.cartCount
    }
  }
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  store
})
