<template>
    <div class="app-profile">
        <div class="mui-card card-top">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                  <img class="card-img" src="http://localhost:4000/images/user/user.jpg" alt="">
                  <span class="name">tom</span>
                  <div class="address">
                        <img class="address-img" src="http://localhost:4000/images/user/address.png" alt="">
                        <span class="address-text">收获地址</span>
                  </div>
                </div>
            </div>
        </div>
        <div class="order">
            <div class="myorder">我的订单</div>
            <div class="order-item">
                <div class="order-list"  v-for="item  of list" :key="item.id">
                    <img class="order-img" :src="item.img_url" alt="">
                    <p class="oreder-title">{{item.title}}</p>
                </div>
            </div>
        </div>
        <div class="slider">
        </div>
        <div class="my-custome">
            <div class="my-custome-item " v-for="item of myself">
                <i class="arrow" ><img src="http://localhost:4000/images/shop-tab/arrow.png" alt=""></i>
                <img :src="item.img_url" alt="">
                <span>{{item.title}}</span>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                list:[
                    {id:1,title:"待付款",img_url:"http://localhost:4000/images/shop-tab/01.png"},
                    {id:2,title:"代发货",img_url:"http://localhost:4000/images/shop-tab/03.png"},
                    {id:3,title:"待收货",img_url:"http://localhost:4000/images/shop-tab/02.png"},
                    {id:4,title:"已完成",img_url:"http://localhost:4000/images/shop-tab/09.png"},
                    {id:5,title:"售后",img_url:"http://localhost:4000/images/shop-tab/08.png"},
                ],
                myself:[
                    {title:"我的优惠券",img_url:"http://localhost:4000/images/shop-tab/cards0.png"},
                    {title:"领券中心",img_url:"http://localhost:4000/images/shop-tab/cards1.png"},
                    {title:"在线客服",img_url:"http://localhost:4000/images/shop-tab/custome.png"},
                    {title:"关于我们",img_url:"http://localhost:4000/images/shop-tab/about_me.png"},
                    {title:"账户与安全",img_url:"http://localhost:4000/images/shop-tab/self.png"},
                    {title:"问题反馈",img_url:"http://localhost:4000/images/shop-tab/problem.png"},
                ]
            }
        }
    }
</script>
<style>
    .app-profile{
        margin-top: 40px;
        }
    .card-top{
        width: 100%;
        margin-left: 0px !important;
        background: rgb(252, 132, 88) !important;
    }
    .card-img{
        width: 60px;
        height: 60px;
        border-radius: 50%;
        vertical-align: middle;
    }
    .card-top .name{
        vertical-align: middle;
        font-size: 18px;
        margin-left: 20px;
    }
    .address{
        position: absolute;
        background: #f20;
        width: 120px;
        border-radius: 30px;
        right: -10px;
        top:30%;
    }
    .address-img{
        width: 30px;
        height: 30px;
        vertical-align: middle;
        margin-left: 5px;
    }
    .address-text{
        color: #fff;
        margin-left: 5px;
    }
    .order{
        width: 100%;
        background: #fff;
        margin-top: -10px;
    }
    .order .myorder{
        border-bottom: 1px solid #ddd;
        font-size: 14px;
        color: #333;
        padding:10px;
    }
    .order-item{
        display: flex;
        width: 100%;
        margin-top: 10px;
    }
    .order-item .order-img{
        width: 25px;
        height: 25px;
    }
    .order-item .oreder-title{
        color: #333;
        font-size: 12px;
    }
    .order-list{
        display: flex;
        width: 20%;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
    }
    .slider{
    width: 100%;
    height: 10px;
    background: #ddd;
    margin-top:0px;
    }
    .my-custome-item{
        border-bottom: 1px solid #ddd;
        background: #fff;
        padding: 10px;
    }
    .my-custome-item img{
        width: 20px;
        height: 20px;
        vertical-align: middle;
    }
    .my-custome-item span{
        font-size: 14px;
        color: #333;
        margin-left: 10px;
    }
    .my-custome-item:last-child{
        border-bottom: none;
    }
    .my-custome-item .arrow{
        position: absolute;
        right: 5px;
        display: inline-block;
        width: 30px;
        height: 30px;
    }
   
    </style>