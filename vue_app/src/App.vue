<template>
 <div class="app-container">
    <!--1.顶部导航栏-->
    <mt-header fixed title="零食小卖部" class="top-header"></mt-header>
    <!--2.容器显示不同组件-->
    <router-view></router-view>
    <!--3.底部导航栏-->
    <mt-tabbar fixed >
        <mt-tab-item id="tab1" >
        <img slot="icon" src="./img/首页-选中 (1).png" @click="gotohome">
        首页
        </mt-tab-item>
        <mt-tab-item id="tab2"  >
        <img slot="icon" src="./img/类目 品类 分类 类别.png" @click="gotoshopTotal()">
        分类
        </mt-tab-item>
        <mt-tab-item id="tab3">
            <img slot="icon" src="./img/购物车.png" @click="gotoCart">
            购物车
        </mt-tab-item>
        <mt-tab-item id="tab4">
          <img slot="icon" src="./img/我 的.png" @click="gotoMyself">
          我的
        </mt-tab-item>
      </mt-tabbar>

 </div>
</template>

<script>
    export default {
        data(){
            return{}
        },
        methods:{
           gotoshopTotal(){
               this.$router.push("/shoptotal")
           },
           gotohome(){
            this.$router.push("/")
           },
           gotoMyself(){
               this.$router.push("/profile")
           },
           gotoCart(){
            this.$router.push("/cart")
           }
        }
    }
</script>


<style>
.top-header{
    background-color: #f75e5e !important;
}
.mint-tab-item-label{
    
}
</style>
