<!--轮播组件-->
<template>
    <div class="app-carousel">
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item in bannerList" :key="item.id"><img :src="item.img"></mt-swipe-item>
        </mt-swipe>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                
            }
            
        },
        props:["bannerList"] //子组件接受父组件数据时候
    }
</script>
<style scoped>
    
</style>