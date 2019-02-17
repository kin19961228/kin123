import Vue from 'vue'
import Router from 'vue-router'
import home from './components/home/home.vue'
import fenlei from './components/fenlei/fenlei.vue'
import pindao from './components/pindao/pindao.vue'
import login from './components/user/login.vue'
import register from './components/user/register.vue'
import product from './components/pindao/shangwu.vue'
import details from './components/pindao/details.vue'
import cart from './components/cart/cart.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {path:"/",component:home},
    {path:"/home",component:home},
    {path:"/fenlei",component:fenlei},
    {path:"/pindao",component:pindao},
    {path:"/login",component:login},
    {path:"/register",component:register},
    {path:"/shangwu",component:product},
    {path:"/details",component:details},
    {path:"/cart",component:cart},
  ]
})
