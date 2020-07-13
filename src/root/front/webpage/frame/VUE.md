#  VUE

> 写作要一个字一个字敲，复制粘贴最终是别人的，即使是重复，那也是在学习

### 简介

Vue（读音/vju:/, 类似于view）是一套用于构建用户界面的**渐进式框架**。于其他大型框架不同的是，Vue被设计为可以自底向上逐层应用。Vue的核心库只关注视图层，不仅易于上手，还便于和第三方库或既有项目整合。另一方面，当于**现代化的工具链**以及各种**支持类库**结合使用，Vue也完全能够为复杂的单页面应用提供驱动。

### 如何尝试Vue

1. 引入类库

    ```
    // 开发环境版本
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    
    // 生产环境版本
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    ```

2. 写代码

    ```
    <div id="app">
    	{{message}}
    </div>
    
    var app = new Vue({
    
    	el : '#app',
    	data:{
    		message: 'hello world'
    	}
    })
    ```

    

    ### Vue生命周期

    ![Vue](https://cn.vuejs.org/images/lifecycle.png)

    

    #### 生命周期常用场景

    1. ajax请求数据放在哪个环节处理？

        **create**和**mounted**环节都可以



	### 模板语法

	#### 插值

##### 文本

常用

`<sapn>message: {{msg}}</span>`

v-once : 执行一次性插值

`<span v-once>{{msg}}</span>`

v-html : 输出真正的HTML

`<span v-html="rawHtml"></span>`