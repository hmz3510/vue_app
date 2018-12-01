<template>
    <div class="app-detais">
        <!-- <carousel :bannerList="this.bannerList"></carousel>  轮播组件 -->
        <div class="app-details-head" >
            <div class="heat-content" v-for="item of product">
                <div class="header">
                    <img :src="item.img" alt="">
                    <p class="header-title">{{item.title}}</p>
                    <div class="took">
                        <p class="now-price">￥{{item.price.toFixed(2)}}</p>
                        <p class="old-price">￥15.55</p>
                        <p class="slode">销量：3555包</p>
                    </div>
                </div>
                <div class="promise">
                    <div class="promise-icon">
                        <img src="http://localhost:4000/images/icons/dui.png" alt="">
                        <p>正品保障</p>
                    </div>
                    <div class="promise-icon">
                        <img src="http://localhost:4000/images/icons/dui.png" alt="">
                        <p>极速发货</p>
                    </div>
                </div>
                <div class="slider">
                </div>
                <div class="size">
                    <p class="choose">选择</p>
                    <p class="chose-size">规格</p>
                    <i class="arrow" ><img src="http://localhost:4000/images/shop-tab/arrow.png" alt=""></i>
                </div>
               
            </div>
            
        </div>
        <div class="slider">
        </div>
        <div class="detais-bottom">
            <div class="detais-message">
                <div class="messae-title">
                    <p class="message">商品信息</p>
                    <p class="took">评价</p>
                </div>
            </div>
        </div>
    </div>
</template>





<script>
    import carousel from "../commoe/carouselContainer.vue"
    export default {
        data(){
            return{
                lid:"",
                fid:'',
                bannerList:[],
                product:[],
                details:[]
            }
        },
        methods:{   
            getDetai(){
                var params = this.$route.params.lid
                var lid = params.split("&")[0]
                var fid = params.split("=")[1]
                this.lid = lid
                this.fid= fid;
                if(this.lid&&this.fid !==""){
                    this.$http.get("http://localhost:4000/details/details?lid="+ this.lid + "&family_id=" + fid).then(result=>{
                        console.log(result.body)
                        this.product = result.body.product;
                        this.details = result.body.picture;
    
                    })
                }
            },
        },
        created() {
            this.getDetai()
        },
        components:{
            carousel
        }
    }
</script>

<style>
   .app-detais{
       margin-top: 40px;
   }
   .heat-content{
       width: 100%;
       background: #fff;
   }
   .header{
       position: relative;
       border-bottom: 1px solid #ddd;
   }
   .header img{
       width: 100%;
       height: 250px;
   }
   .header .header-title{
       font-size: 14px;
       color: #333;
       padding-left: 5px;
       margin-top: 5px;
   }
   .header .took{
       display: flex;
       margin-left: 10px;
       margin-top: 20px;
   }
   .took .now-price{
       color: #f20;
       font-size: 16px;
   }
   .took .old-price{
       color: #333;
       text-decoration: line-through;
       margin-left: 10px;
   }
   .took .slode{
      margin-left: 15px;
   }
   .promise{
       background: #fff;
       display: flex;
        height: 40px;
   }
   .promise .promise-icon{
       display: flex;
       padding-top: 5px;
       margin: 5px 15px;
   }
   .promise .promise-icon img{
       width: 20px;
       height: 20px;
       vertical-align: middle;
   }
   .promise .promise-icon P{
       font-size: 14px;
       color: #333;
       margin-left: 10px;
   }
   .size{
       background: #fff;
       display: flex;   
       margin: 10px 15px;
       position: relative;
       height: 20px;
    }
    .size .choose{
        font-size: 16px;
        color: #333; 
      
    }
    .size .chose-size{
        margin-left: 20px;
        margin-top: 1px;
    }
    .size .arrow{
        position: absolute;
        right: 0px;
        display: inline-block;
        width: 30px;
        height: 30px;
        top: -3px;
    }
    .size .arrow img{
        width: 30px;
        height: 30px;
    }
    .detais-bottom{
        background: #fff;
        width: 100%;
    }
    .detais-bottom .detais-message{
        border-bottom:1px solid #ddd
    }
    .detais-bottom .detais-message .messae-title{
        display: flex;
        justify-content: space-around;
        padding-top: 10px;
    }
    .detais-bottom .detais-message .messae-title .message{
        color: rgb(245, 81, 56);
    }
    .detais-bottom .detais-message .messae-title .took{
        color:#333;
    }
</style>