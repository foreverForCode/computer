# 常用方法


### jems.transformLink

> 转化 == content == 为链接

``` js
jems.transformLink = function(content){

    var reg = /==(\S*)==/g;

    var originData = content.match(reg);
    
    if(!originData){

        originData = [];
    }
    var linkData = originData.map(function(item){
        
        return item.replace(/==/g, '');
    
    })

    return {

        originData: originData,
        linkData : linkData
    }
}
```

### jems.debounce

> 函数防抖，保证在防抖期间，目标函数只执行一次

```
    jems.debounce = function(fn, await){
        var timer = null;
        return function(){

            var _this = this;
            var _arguments = arguments;

            clearTimeout(timer);
            timer = setTimeout(function(){

                fn.apply(_this, _arguments);
            }, await)
        }
    }
```
