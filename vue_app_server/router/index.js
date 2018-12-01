const express = require("express");
const router = express.Router();
const pool = require("../pool.js")


/*获取首页数据 */
router.get("/banner",(req,res)=>{
    var sql1 = "select * from sc_index_carousel";
        pool.query(sql1,(err,result)=>{
            if(err) console.log(err)
            res.writeHead(200,{
                'Content-Type':"application/json charset=utf-8",
                "Access-Control-Allow-Origin":'*'
            })
            res.write(JSON.stringify(result))
            res.end();
        })
})

router.get("/index",(req,res)=>{
    var sql2 = 'select * from sc_laptop where family_id = 1';
    var sql3 = 'select * from sc_laptop where family_id = 2 ';
    var sql4 = 'select * from sc_laptop where family_id = 3';
    var output = {cake:[],coffer:[],guo:[]}
    Promise.all([
        new Promise(function(open){
            pool.query(sql2,(err,result)=>{
                if(err) console.log(err)
                output.guo = result;
                open();
            })
        }),
        new Promise(function(open){
            pool.query(sql4,(err,result)=>{
                if(err) console.log(err)
                output.coffer= result;
                open();
            })
        }),
        new Promise(function(open){
            pool.query(sql3,(err,result)=>{
                if(err) console.log(err);
                output.cake=result;
                open();
            })
        }).then(function(){
            res.writeHead(200,{
                'Content-Type':"application/json charset=utf-8",
                "Access-Control-Allow-Origin":'*'
            })
            res.write(JSON.stringify(output))
            res.end();
        })
    ])

})






module.exports = router;

