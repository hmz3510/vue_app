import Vue from 'vue'
import App from './App.vue'
import router from './router'

//0引入mint-ui css
import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//0引入miu的css文件
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'


//完整引入
import MintUI  from "mint-ui";
Vue.use(MintUI)



//1引入vue-resourece所有组件 发送ajax
import VueResource from "vue-resource"
//2将所有组件注册
Vue.use(VueResource)





//增加配置信息 VueResoucre服务器根目录
Vue.http.options.root="http://localhost:3000/";
//修改请求头 POST
//Vue.http.options.emulateJSON = true;





new Vue({
  router,
  render: h => h(App)

}).$mount('#app')
