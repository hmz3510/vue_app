import Vue from 'vue'
import Router from 'vue-router'
import HomeContainer from './components/home/homeContainer.vue'
import DetailsContaier from "./components/details/detailsContainer.vue"
import ShopTotalContainer from "./components/shoptotal/shopTotalContainer.vue"
import LoginContainer from "./components/login/loginContainer.vue"
import ProfileContainer from "./components/profile/profileContainer.vue"
import  CartContainer  from "./components/cart/cartContainer.vue"


 //引入自定义组件

Vue.use(Router)

//配置访问自定义组件路径
export default new Router({
  routes: [
    {path:'/',component:HomeContainer},
    {path:'/home',component:HomeContainer},
    {path:"/login",component:LoginContainer},
    {path:'/details/:lid',component:DetailsContaier},
    {path:"/shoptotal",component:ShopTotalContainer},
    {path:"/profile",component:ProfileContainer},
    {path:"/cart",component:CartContainer},
    {path:'**',redirect:HomeContainer}
  ]
})
