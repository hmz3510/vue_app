<template>
    <div class="app-cart" >
        <div class="cart-empty" v-if="list<=0">
            <i><img src="http://localhost:4000/images/shop-tab/car01.png" alt=""></i>
            <p class="cart-text">你的购物车空空如也~~~</p>
            <mt-button size="small" type="primary">去购物</mt-button>
        </div>
        <div class="cart-list" v-else>
            <div class="cart-item" v-for="(item,index) of list">
                <mt-cell-swipe class="myswipe" :right="[
                        {
                        content: '删除',
                        style: { background: '#fd5f47', color: '#fff' },
                        handler: function(){ delProduct(item.iid) }
    
                        }
                ]">
                <div class="item-left">
                    <input type="checkbox" class="select" @click="hasSelect(index)"  >
                    <img class="item-img" :src="item.img" alt="">
                </div>
                <div class="item-content">
                    <p class="item-name">{{item.title}}</p>
                    <p class="size">规格：默认</p>
                    <p class="price">￥{{item.price.toFixed(2)}}</p>
                </div>
                <div class="item-button">
                    <button class="del" @click="delCount(item.iid)">-</button>
                    <input type="number" class="myinput"   v-model="item.count">
                    <button class="add" @click="addCount(item.iid,index)">+</button>
                </div>
                </mt-cell-swipe>
                  
            </div>
            
        </div>

        <div class="app-bottom">
            <div class="buy-left">
                <input type="checkbox" :checked="ifallSelect" @click="selectAll">
                <span class="allSelect" >全选</span>
                <p class="price">总计</p>
                <p class="totalprice">￥{{totalMoney.toFixed(2)}}</p>
            </div>
            <div class="buy-button">
                <mt-button type="primary" size="normal" class="buy">删除</mt-button>
                <mt-button type="danger" size="normal" class="buy" @click="pay">去支付</mt-button>
            </div>
        </div>
    </div>
   
</template>
<script>
    import {Toast} from "mint-ui"
    export default {
        data(){
            return{
                uid:1,
                list:[],
                count:1,
                ifallSelect:false,
                totalMoney:0,
                check_goods:[],
                isSelect:true
            }
        },
        methods:{
            getList(){
                this.$http.get("http://localhost:4000/carts/cartlist?uid="+this.uid).then((res)=>{
                  
                    this.list=res.body;
                })
            },
            delProduct(iid){        
                this.$messagebox({
                    title:"温馨提示",
                    message:"是否从购物车中移除?",
                    showCancelButton:true
                }).then(action=>{
                    if(action=="confirm"){
                        this.$http.get("http://localhost:4000/carts/delete?iid="+iid).then(res=>{
                            if(res.body.ok==1){
                                Toast("删除成功")
                                this.getList();
                            }
                        })
                    }else{
                        Toast("您点了取消,删除失败")
                    }
                })
            },
            addCount(iid){
               for(var item of this.list){
                   if(item.iid == iid){
                      var count = item.count;
                      count++;
                      this.$http.get("http://localhost:4000/carts/update/?iid="+iid +"&count=" + count).then(res=>{
                          this.getList();
                      })

                   }
               }
            
              
            },
            delCount(iid){
                for(var item of this.list){
                   if(item.iid == iid){
                      var count = item.count;
                      count--;
                      this.$http.get("http://localhost:4000/carts/update/?iid="+iid +"&count=" + count).then(res=>{
                            if(count==1){
                                this.$messagebox({
                                title:"温馨提示",
                                message:"是否从购物车中移除?",
                                showCancelButton:true
                                }).then(res=>{
                                    if(res=="confirm"){
                                        this.$http.get("http://localhost:4000/carts/delete?iid="+iid).then(res=>{
                                        if(res.body.ok==1){
                                            Toast("已从购物车中移除")
                                            this.getList();  
                                        }
                                        })
                                    }
                                })
                            }
                        this.getList();    
                      })

                    }
               }
            },
            hasSelect(index){
                var sum=0;  
                this.list[index].isselect = !this.list[index].isselect
                if(this.list[index].isselect){
                    this.check_goods.push(this.list[index])  
                    this.totalMoney += this.list[index].count * this.list[index].price
                }else{
                    this.totalMoney -= this.list[index].count * this.list[index].price
                    this.check_goods.pop(this.list[index],1)
                }
                for(var item of this.list){         
                    sum += item.price * item.count;
            
                }
                if(sum==this.totalMoney){
                    this.ifallSelect = true
                }else{
                    this.ifallSelect = false;
                }
            },
            selectAll(){
                this.ifallSelect = !this.ifallSelect;
                if(this.ifallSelect){
                    for(var item of this.list){
                        this.totalMoney += item.price * item.count;
                    }
                  
                }else{
                    this.totalMoney=0
                    
                }
            },
            pay(){
                Toast({
                    message: '正在支付中,请稍后',
                });
            }
        },
        created() {
            this.getList();
        },
        computed:{
            getSum(){
                //console.log(this.check_goods)
                this.totalMoney=0;
                this.check_goods.forEach(item => {
//                      总价 = 价格 * 数量
                        this.totalMoney += Number(item.price) * Number(item.count)
                    })
                return this.totalMoney;
            }
        }
    }
</script>
<style>
    .app-cart{
        position: relative;
        height: 100%;
        width: 100%;
    }
    .cart-empty{
        height: 100%;
        width: 100%;
        margin-top: 50px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .cart-empty i{
        display: inline-block;
        width: 60px;
        height: 60px;
        background: #ccc;
        border-radius: 50%;
        position: relative;
    }
    .cart-empty img{
        width: 25px;
        height: 25px;
       position: absolute;
       top: 15px;
       left: 15px;
    }
    .cart-empty .cart-text{
        font-size: 14px;
        color: #333;
        padding-left: 10px;
        margin: 10px;
    }

    .cart-list{
        margin-top: 50px;
    }
    .cart-item{
        border-bottom:1px solid #ddd;

    }
    .myswipe{
        width: 100% !important;
    }
    .item-left{
        position: absolute;
        left: 20px;
    }
    .cart-item .item-img{
        width: 70px;
        height: 70px;
        margin-left: 10px;
    }
   
    .mint-cell-swipe-button{
        line-height: 90px !important;
    }
    .item-content{
        width: 150px;
        height: 100%;
        margin-top: 5px;
    }
    .item-content .item-name{
        font-size: 16px;
        color: #333;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .item-content .size{
        color: #333;
    }
    .item-content .price{
        color: #f20;
        font-size: 14px;
    }
    .item-button{
        margin-top: 50px;
       
    }
    .item-button button{
        width: 25px;
        height: 25px;
        border-radius: 0;
        line-height: 0px;
        padding:0;
    }
    .item-button .del{
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
    }
    .item-button .add{
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
    }
    .item-button .myinput{
        width: 35px;
        height: 25px;
        border-radius: 0;
        text-align: center;
        padding-left: 3px;
        padding-right: 0px;
    }
    .app-bottom{
        background: #fff;
        position: fixed;
        bottom: 55px;
        z-index: 100;
        width: 100%;
        display: flex;
        justify-content: space-between;
    }
    .buy-left{
        display: flex;
        padding: 10px;
    }
    .buy-left input{
        margin-top: 5px;
        margin-left: 12px;
    }
    .buy-left .allSelect{
        font-size: 14px;
        color: #333;
        margin-left: 10px;
    }
    .buy-left .price{
        color: #333;
        margin: 0 10px;
    }
    .buy-left .totalprice{
        color: #f20;
        font-size: 16px;
    }
    .buy{
        border-radius: 0px !important;
    }
</style>