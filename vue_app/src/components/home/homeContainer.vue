<template>
    <div class="app-homeContainer">
        <mt-header fixed title="零食小卖部" class="top-header"></mt-header>
        <mt-swipe :auto="4000">
            <mt-swipe-item v-for="item of banner" :key="item.lid" v-lazy >
                <img :src="item.img" alt="">
            </mt-swipe-item>
        </mt-swipe>
        <div class="home-youhui">
            <div class="youhui-title">
                <div class="cards">
                    <img class="cards-img" src="../../img/优惠券.png" alt="">
                    <span class="cards-title">专属优惠券</span>
                </div>
                <div class="more">
                    更多
                </div>
            </div>
            <div class="youhui">
                <div class="list-item">
                    <img src="../../img/8082f3240286d371.jpg" alt="">
                </div>
            </div>
        </div>
        <div class="slider">
        </div>
        <div class="food-content">
            <div class="food-list">
                <div class="title">
                <div class="header">
                    <span class="line"></span>
                    <span class="name">营养蛋糕</span>
                    <span class="line"></span>
                </div>
                    <span class="more">更多</span>
                </div>
                <div class="food-item" >
                    <div class="foods" v-for="item of list.cake" @click="handClick(item.lid,item.family_id)" :key="item.lid">
                        <img :src="item.img" alt="">
                        <p class="food-title">{{item.title}}</p>
                        <p class="food-price">￥{{item.price.toFixed(2)}}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider">
        </div>
        <div class="food-content">
                <div class="food-list">
                    <div class="title">
                    <div class="header">
                        <span class="line"></span>
                        <span class="name">咖啡饮料</span>
                        <span class="line"></span>
                    </div>
                        <span class="more">更多</span>
                    </div>
                    <div class="food-item" >
                        <div class="foods" v-for="item of list.coffer" @click="handClick(item.lid)" :key="item.lid">
                            <img :src="item.img" alt="">
                            <p class="food-title">{{item.title}}</p>
                            <p class="food-price">￥{{item.price.toFixed(2)}}</p>
                        </div>
                    </div>
                </div>
        </div>
        <div class="slider">
        </div>
        <div class="food-content food-bo">
                <div class="food-list">
                    <div class="title">
                    <div class="header">
                        <span class="line"></span>
                        <span class="name">坚果梅子</span>
                        <span class="line"></span>
                    </div>
                        <span class="more">更多</span>
                    </div>
                    <div class="food-item" >
                        <div class="foods" v-for="item of list.guo" @click="handClick(item.lid)" :key="item.lid">
                            <img :src="item.img" alt="">
                            <p class="food-title">{{item.title}}</p>
                            <p class="food-price">￥{{item.price.toFixed(2)}}</p>
                          
                        </div>
                        
                    </div>
                </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                banner:[],
                list:{}
            }
        },
        methods:{
            //获取首页数据
            getData(){
                this.$http.get("http://localhost:4000/index/banner").then(result=>{
                    this.banner = result.body;
                   
                })
            },
            getContent(){
                this.$http.get("http://localhost:4000/index/index").then(result=>{
                    this.list = result.body;
                    console.log(this.list)
                })
            },
            handClick(lid,fid){
                // console.log(lid)
                 this.$router.push("/details/" + lid + "&fid=" + fid)
            }
        },
        created() {
            this.getData();
            this.getContent();
        },
    }

</script>

<style>
.top-header{
    background-color: #f75e5e !important;
}
.mint-swipe{
    margin-top: 40px;
    height: 240px;
}
.mint-swipe .mint-swipe-items-wrap{
    height: 240px;
}
.mint-swipe .mint-swipe-items-wrap img{
    width: 100%;
    height: 240px;
}
.mint-swipe-item{
    height: 240px;
}

.youhui-title{
    border-bottom:1px solid #ddd;
    display: flex;
    justify-content: space-between;
    height: 45px;
}
.cards{
    margin-left: 20px;
    padding: 10px 0px;
}
.cards-img{
    width: 20px;
    height: 20px;
    vertical-align: top;
}
.cards .cards-title{
    font-size: 14px;
    margin-left: 10px;
    color: #fc8e11;
    
}
.more{
    font-size: 14px;
    padding: 10px 0px;
    margin-right: 10px;
}
.list-item{
    margin-top: 5px;
    background: #fff;
}
.list-item img{
    width: 100%;
    height: 100%;
   
}
.slider{
    width: 100%;
    height: 10px;
    background: #ddd;
    margin-top:0px;
}
.food-content{
    position: relative;
    background: #fff;
    
}
.food-list{
    background: #fff;
}
.title{
    display: flex;
    justify-content:    space-around;
    border-bottom: 1px solid #ddd;
    align-items: center;
}
.title .header{
    width: 40%;
    margin:  0 auto;
    margin-left: 120px;
} 

.title .line{
       width: 10px;
        display: inline-block;
        position: relative;
        border-bottom: 1px solid #ccc;
        vertical-align: middle;
        margin: 0px 15px;
}
.title .name{
    font-size: 14px;
    color: #333;

}
.food-item{
    display: flex;
    width: 100%;
    flex-wrap: wrap;
}
.food-item .foods{
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 33.33%;
    height: 100%;
    margin-top: 5px;
}
.food-item .foods img{
    width: 100px;
    height: 100px;
}
.food-item .foods .food-title{
    color: #333;
    font-size: 12px;
    text-overflow: ellipsis;    
    overflow: hidden;
    width: 100px;
    height: 45px;
    
}
.food-item .food-price{
    color: #f20;
    font-size: 16px;
}
.food-bo{
    padding-bottom: 45px;
}
</style>