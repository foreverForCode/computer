## 弹框

实例代码

```js

var content = 'hello world';
var idx = mBox.open({
    width : "80%",
    title :['温馨提示','color:#333;font-size:16px;text-align:center;font-weight:500'],
    content : '<div style="postion:relative; box-sizing:border-box">'+content+'</div>',
    closeBtn: [false],
    btnName : ['同意并继续','不同意',],
    maskClose : false,
    btnStyle:["color:#B800E1"],
    yesfun    : function () {
        
        _this.signAgree(idx);
    },
    nofun:function () {

        jems.goUrl('/wx/index.html');
    }
})

```

### 不同形态的弹框
```
var Waits = mBox.open({
    boxtype: 3,
    conStyle: 'text-align:center;',
    maskColor: "rgba(0,0,0,0.3)",
    time: 0,
    content: '<div class="sodLoadingIcon"></div><p style="line-height:20px; margin-top:12px">努力提交订单中（<span class="countDown">5</span>s）</p>',
    success: function () {
        
    }})
```







