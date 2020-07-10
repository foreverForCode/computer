## 复制

实例代码

```js

    var clipboard = null;

	var status = 'init'; // init -> active

    jems.copy = function(){

		status = 'active';

		if(!clipboard){

			clipboard = new ClipboardJS('.clipboard', {
				target: function () {
					return $('#clipboardText')[0];
				}
			});
		}

		clipboard.on('success', function (e) {

			if(status == 'active'){

				jems.tipMsg('复制成功');

				status = 'init';
			}

		});
		clipboard.on('error', function (e) {

			if(status == 'active'){

				jems.tipMsg('复制失败');

				status = 'init';
			}
		});
	}
```

``` html

<div class="flexbox g3 f14 fw500 lh100">
    <span>发票单号：</span>
    <span id="clipboardText"><%= data.id %></span>
</div>
<span class="copy f12 g6 ml12 lh100 btn clipboard" onclick="jems.copy()">复制</span>
```







