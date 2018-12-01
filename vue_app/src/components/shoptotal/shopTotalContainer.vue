<template>
    <div class="shop-total">
        <div class="search">
            <mt-search placeholder="搜索"></mt-search>
        </div>
        <carousel :bannerList="this.bannerList"></carousel>
        <div class="shop-list">
            <div class="shop-item" v-for="item of list">
                <img :src="item.img" alt="">
                <p>{{item.name}}</p>
            </div>
        </div>
    </div>

</template>
<script>
    import carousel from "../commoe/carouselContainer.vue"
    
    export default {
        data(){
            return{
                list:[
                    {id:1,name:"营养蛋糕",img:"http://localhost:4000/images/icons/cake1.png"},
                    {id:2,name:"坚果梅子",img:"http://localhost:4000/images/icons/nut.png"},
                    {id:3,name:"甜品小吃",img:"http://localhost:4000/images/icons/chocolate.png"},
                    {id:4,name:"糖果软糖",img:"http://localhost:4000/images/icons/candy.png"},
                    {id:5,name:"饮料小吃",img:"http://localhost:4000/images/icons/tea.png"},
                ],
                bannerList:[]
            }
        },
        methods:{
            getBanner(){
                this.$http.get("http://localhost:4000/index/banner").then(result=>{
                    this.bannerList=result.body
                    
                })
            }
        },
        created() {
            this.getBanner();
        },
        components:{
            carousel
        }
    }
</script>
<style>
    .shop-list{
        background: #fff;
        margin-top: 10px;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        padding-left: 30px;
    }
    .shop-item{
      width: 25%;
      margin-bottom: 20px;
    }
    .shop-item p{
        font-size: 14px;
        color: #333;
    }
    .search{
        margin-top: 45px;
        height: 0px;
    }
    .mint-searchbar input{
        width: 0;
        height: 0;
    }
   input[type='search']{
        margin-top: 15px;
        -webkit-appearance:none;
        border: none;
        height: 20px !important;
        left: 20px;
        background: #fff !important;
    }

</style>
