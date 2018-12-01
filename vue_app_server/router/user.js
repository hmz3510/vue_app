const express = require("express");
const router = express.Router();
const pool = require("../pool.js")



router.get("/login",(req,res)=>{
    var uname = req.query.uname;
    var upwd = req.query.upwd;
    var sql = "select * from sc_user where uname=? and upwd=?";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) console.log(err)
        if(result.length>0){
            
          res.writeHead(200,{
            "Access-Control-Allow-Origin":'*'
          })
          res.write(JSON.stringify({
              ok:1
          }))
          res.end()
        }
    })
})



router.post("/getUser",(req,res)=>{
    var openid = req.body.openid;
    var sql = "select * from sc_user where openid = ?"

    pool.query(sql,[openid],(err,result)=>{
        if(err) console.log(err)
        res.writeHead(200,{
            'Content-Type':"application/json charset=utf-8",
            "Access-Control-Allow-Origin":'*'
        })
        res.write(JSON.stringify(result));
        res.end()
    })
})




module.exports = router;