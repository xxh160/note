# Vue tips

值得一记的 vue 注意点。

## api

后端返回的信息被包裹在一个复杂对象的 data 属性中，别忘了`return res.data`。

## props 和 data

data 对于外界只可读不可写，能够通过`v-bind`修改的是 props。

## methods

methods 内不要使用箭头函数，没法正确绑定 this。

其实不止是 methods，除了一些本地使用的临时函数，别的时候，尤其是需要操作 this 的时候，干脆就用老办法，或者是 ES6 的语法`data(){}`。

## :is

vue 的 `<component>` 中有个属性 is，可以作为切换的组件名。大概意思是，`<component>`是所有组件的父类，通过`:is="..."`来确定绑定到哪个组件子类上。

## v-if v-else v-else-if v-show

前三个元素在条件为否的时候不会出现在 DOM 树中。

v-if 的渲染是惰性的。如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。

v-if 在管理多个元素的时候，可以托管到`<template></template>`上，最终渲染结果不带`<template></template>`

```html
<template v-if="ok">
  <h1>Title</h1>
  <p>Paragraph 1</p>
  <p>Paragraph 2</p>
</template>
```

v-else 必须紧紧跟在 v-if 或者 v-else-if 块后边，否则无法识别。同理，v-else-if 必须跟在 v-if 或者 v-else-if 后边。

带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS property display。

v-show 不支持`<template>`元素，也不支持 v-else。

所以如果要频繁切换，用 v-show，反之 v-if。

## v-for

v-for 在更新状态时，默认不移动 DOM 元素，只是在原来的位置更新。换言之，如果采用默认更新策略，列表的顺序只在第一次渲染时有效。

可以给每次迭代一个唯一的标识符`:key`来替换掉默认策略，从而可以重新排序所有元素。

尽可能为 v-for 提供一个 key。除非需要性能或者是特别简单的渲染。
