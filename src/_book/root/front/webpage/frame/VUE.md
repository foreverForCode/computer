## VUE

### Vue简介

Vue (读音 /vjuː/，类似于 **view**) 是一套用于构建用户界面的**渐进式框架**。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与[现代化的工具链](https://cn.vuejs.org/v2/guide/single-file-components.html)以及各种[支持类库](https://github.com/vuejs/awesome-vue#libraries--plugins)结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。



### 快速上手

```html
// 直接引入
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
```



### 基本语法

vue的模板语法其实很简单，有一些语法规则

#### demo

```
<div id="app">
  {{ message }}
</div>

var app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})
```

#### 条件和循环

##### 条件渲染

###### v-if

```
<div id="app-3">
  <p v-if="seen">现在你看到我了</p>
  <p v-else></p>
</div>

var app3 = new Vue({
  el: '#app-3',
  data: {
    seen: true
  }
})

```

> app3.seen也可以动态的改变数据

###### 用key管理可复用的元素

```
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address">
</template>
```

> 那么在上面的代码中切换 `loginType` 将不会清除用户已经输入的内容。因为两个模板使用了相同的元素，`` 不会被替换掉——仅仅是替换了它的 `placeholder`

```
<template v-if="loginType === 'username'">
  <label>Username</label>
  <input placeholder="Enter your username" key="username-input">
</template>
<template v-else>
  <label>Email</label>
  <input placeholder="Enter your email address" key="email-input">
</template>
```

> 现在，每次切换时，输入框都将被重新渲染

#### v-show

```
<h1 v-show="ok">Hello!</h1>
```

本质：不同的是带有 `v-show` 的元素始终会被渲染并保留在 DOM 中。`v-show` 只是简单地切换元素的 CSS property `display`

> 注意，`v-show` 不支持 ` 元素，也不支持 `v-else

#### v-if vs v-show

`v-if` 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

`v-if` 也是**惰性的**：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。

相比之下，`v-show` 就简单得多——不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换。

一般来说，`v-if` 有更高的切换开销，而 `v-show` 有更高的初始渲染开销。因此，如果需要非常频繁地切换，则使用 `v-show` 较好；如果在运行时条件很少改变，则使用 `v-if` 较好

#### v-for

 ```
<div id="app-4">
  <ol>
    <li v-for="(todo, index) in todos" :key="$index">
      {{ todo.text }}
    </li>
  </ol>
</div>

var app4 = new Vue({
  el: '#app-4',
  data: {
    todos: [
      { text: '学习 JavaScript' },
      { text: '学习 Vue' },
      { text: '整个牛项目' }
    ]
  }
})
 ```

> app4.todos.push({text:'新项目'})，内部改变不会触发视图更新

###### v-for使用对象

```
<div v-for="(value, name, index) in object">
  {{ index }}. {{ name }}: {{ value }}
</div>
```

###### 数组变更

* `push()`
* `pop()`
* `shift()`
* `unshift()`
* `splice()`
* `sort()`
* reverse()

###### 替换数组

> 针对filter(), concat() , slice()

```
example1.items = example1.items.filter(function (item) {
  return item.message.match(/Foo/)
})
```

###### 显示过滤/排序后的结果

```
<li v-for="n in evenNumbers">{{ n }}</li>

data: {
  numbers: [ 1, 2, 3, 4, 5 ]
},
computed: {
  evenNumbers: function () {
    return this.numbers.filter(function (number) {
      return number % 2 === 0
    })
  }
}
```



#### 用户输入

##### v-model

```
<div id="app-6">
  <p>{{ message }}</p>
  <input v-model="message">
</div>

var app6 = new Vue({
  el: '#app-6',
  data: {
    message: 'Hello Vue!'
  }
})

```

#### 事件监听

#### v-on

别名：@

```
<div id="app-5">
  <p>{{ message }}</p>
  <button v-on:click="reverseMessage">反转消息</button>
</div>

var app5 = new Vue({
  el: '#app-5',
  data: {
    message: 'Hello Vue.js!'
  },
  methods: {
    reverseMessage: function () {
      this.message = this.message.split('').reverse().join('')
    }
  }
})
```

> 事件监听也能触发一下js代码

```
<div id="example-1">
  <button v-on:click="counter += 1">Add 1</button>
  <p>The button above has been clicked {{ counter }} times.</p>
</div>

var example1 = new Vue({
  el: '#example-1',
  data: {
    counter: 0
  }
})
```

##### 内联处理

```
<div id="example-3">
  <button v-on:click="say('hi')">Say hi</button>
  <button v-on:click="say('what')">Say what</button>
</div>

new Vue({
  el: '#example-3',
  methods: {
    say: function (message) {
      alert(message)
    }
  }
})

//有时也需要在内联语句处理器中访问原始的 DOM 事件。可以用特殊变量 $event 把它传入方法：

<button v-on:click="warn('Form cannot be submitted yet.', $event)">
  Submit
</button>
```



#### 创建组件

> 这是针对多页面创建组件

```
// 定义名为 todo-item 的新组件
Vue.component('todo-item', {
  // todo-item 组件现在接受一个
  // "prop"，类似于一个自定义 attribute。
  // 这个 prop 名为 todo。
  props: ['todo'],
  template: '<li>{{ todo.text }}</li>'
})

var app = new Vue(...)

<ol>
  <!-- 创建一个 todo-item 组件的实例 -->
   <todo-item
      v-for="item in groceryList"
      v-bind:todo="item"
      v-bind:key="item.id"
    ></todo-item>
</ol>
```

### 模板语法

#### v-once

功能：执行一次性的插值，当数据改变时，插值处的内容不会更新

#### v-html

功能：输出真正的HTML

#### Attribute

功能：动态绑定标签属性

```
<div v-bind:id="dynamicId"></div>
```

新增

> Vue版本 > 2.6.0

```
<!--
注意，参数表达式的写法存在一些约束，如之后的“对动态参数表达式的约束”章节所述。
-->
<a v-bind:[attributeName]="url"> ... </a>
<a v-on:[eventName]="doSomething"> ... </a>
```



#### Javascript

功能：javascript表达式支持


失败:

```
<!-- 这是语句，不是表达式 -->
{{ var a = 1 }}

<!-- 流控制也不会生效，请使用三元表达式 -->
{{ if (ok) { return message } }}
```

#### 修饰键

|            修饰键            |                            功能                            |                             备注                             |
| :--------------------------: | :--------------------------------------------------------: | :----------------------------------------------------------: |
|           prevent            |                        阻止默认事件                        |      `<form v-on:submit.prevent="onSubmit">...</form>`       |
|             stop             |                        阻止事件传播                        |                   event.stopPropagation()                    |
|           capture            | 即内部元素触发的事件先在此处理，然后才交由内部元素进行处理 |          <div v-on:click.capture="doThis">...</div>          |
|                              |                    点击事件只会触发一次                    |               <a v-on:click.once="doThis"></a>               |
|           passive            |               滚动事件的默认行为将会立即触发               |        <div v-on:scroll.passive="onScroll">...</div>         |
|         keyup.enter          |             按键修饰符，只有按键是Enter才触发              |              <input v-on:keyup.enter="submit">               |
|        keyup.keyCode         |                      按键码【已废弃】                      |                <input v-on:keyup.13="submit">                |
| keyup.ctrl\|alt\|shift\|meta |                         系统修饰键                         | <input v-on:keyup.alt.67="clear"><!-- Alt + C --><div v-on:click.ctrl="doSomething">Do something</div> |
|            exact             | 修饰符允许你控制由精确的系统修饰符组合触发的事件【+2.5.0】 | <!-- 即使 Alt 或 Shift 被一同按下时也会触发 --> <button v-on:click.ctrl="onClick">A</button> <!-- 有且只有 Ctrl 被按下的时候才触发 --> <button v-on:click.ctrl.exact="onCtrlClick">A</button> <!-- 没有任何系统修饰符被按下的时候才触发 --> <button v-on:click.exact="onClick">A</button> |

> 不要把 `.passive` 和 `.prevent` 一起使用，因为 `.prevent` 将会被忽略，同时浏览器可能会向你展示一个警告。请记住，`.passive` 会告诉浏览器你*不*想阻止事件的默认行为。

### 计算属性和侦听器

#### 计算属性

含义：用于简单运算，可以响应式返回数据，如果依赖的数据没有变化，不会重新计算

实例：

```
<div id="example">
  <p>Original message: "{{ message }}"</p>
  <p>Computed reversed message: "{{ reversedMessage }}"</p>
</div>

var vm = new Vue({
  el: '#example',
  data: {
    message: 'Hello'
  },
  computed: {
    // 计算属性的 getter
    reversedMessage: function () {
      // `this` 指向 vm 实例
      return this.message.split('').reverse().join('')
    }
  }
})
```

#### 侦听属性

含义：观察和响应Vue实例上的数据变动

 ```
<div id="demo">{{ fullName }}</div>

var vm = new Vue({
  el: '#demo',
  data: {
    firstName: 'Foo',
    lastName: 'Bar',
    fullName: 'Foo Bar'
  },
  watch: {
    firstName: function (val) {
      this.fullName = val + ' ' + this.lastName
    },
    lastName: function (val) {
      this.fullName = this.firstName + ' ' + val
    }
  }
})

// 计算属性的set
computed: {
  fullName: {
    // getter
    get: function () {
      return this.firstName + ' ' + this.lastName
    },
    // setter
    set: function (newValue) {
      var names = newValue.split(' ')
      this.firstName = names[0]
      this.lastName = names[names.length - 1]
    }
  }
}
 ```

### Class与Style绑定

#### 绑定Class

```
<div
  class="static"
  v-bind:class="{ active: isActive, 'text-danger': hasError }"
></div>

data: {
  isActive: true,
  hasError: false
}

```

##### class数组语法

```
<div v-bind:class="[activeClass, errorClass]"></div>
data: {
  activeClass: 'active',
  errorClass: 'text-danger'
}

<div v-bind:class="[isActive ? activeClass : '', errorClass]"></div>

```

#### 绑定Style

```
<div v-bind:style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>

data: {
  activeColor: 'red',
  fontSize: 30
}
```

#### 表单输入绑定

##### 复选框

  ```
<input type="checkbox" id="checkbox" v-model="checked"> 

<label for="checkbox">{{ checked }}</label>

多个复选框，绑定到同一个数组：

<input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
<label for="jack">Jack</label>
<input type="checkbox" id="john" value="John" v-model="checkedNames">
<label for="john">John</label>
<input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
<label for="mike">Mike</label>
<br>
<span>Checked names: {{ checkedNames }}</span>

new Vue({
  el: '...',
  data: {
    checkedNames: []
  }
})
  ```

##### 单选框

```
<div id="example-4">
  <input type="radio" id="one" value="One" v-model="picked">
  <label for="one">One</label>
  <br>
  <input type="radio" id="two" value="Two" v-model="picked">
  <label for="two">Two</label>
  <br>
  <span>Picked: {{ picked }}</span>
</div>

new Vue({
  el: '#example-4',
  data: {
    picked: ''
  }
})
```

##### 选择框

```
<div id="example-5">
  <select v-model="selected">
    <option disabled value="">请选择</option>
    <option>A</option>
    <option>B</option>
    <option>C</option>
  </select>
  <span>Selected: {{ selected }}</span>
</div>

new Vue({
  el: '...',
  data: {
    selected: ''
  }
})

```

> 如果 `v-model` 表达式的初始值未能匹配任何选项，`` 元素将被渲染为“未选中”状态。在 iOS 中，这会使用户无法选择第一个选项。因为这样的情况下，iOS 不会触发 change 事件。因此，更推荐像上面这样提供一个值为空的禁用选项。

##### 多选选择框

```
<div id="example-6">
  <select v-model="selected" multiple style="width: 50px;">
    <option>A</option>
    <option>B</option>
    <option>C</option>
  </select>
  <br>
  <span>Selected: {{ selected }}</span>
</div>

new Vue({
  el: '#example-6',
  data: {
    selected: []
  }
})
```

