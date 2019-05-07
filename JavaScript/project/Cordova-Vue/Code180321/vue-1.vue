<!--
  Copyright (c) 2019 faylib.top

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
-->


<template>
    <div id="view1">
        Show myself！
    </div>
    <div class="view2">
        Show myself！
    </div>
</template>


<script>
    export default {
        name: 'Vue-1',
        beforeCreate: function () {
            var div1 = document.getElementById('view1')
            div1.setAttribute('style', 'background-color:white')

            var div2 = document.getElementsByClassName('view2')
            div2[0].setAttribute('style', 'background-color:white')
            div2[0].className = 'view3'
        }
    }
</script>


<style>
    #view1 {
        background-color: lightgray;
        width: auto;
        height: 44px;
        text-align: center; /* 在父容器里水平居中 inline 文字，或 inline 元素 */
        line-height: 44px; /* 与 height 联手，垂直居中文字 */
    }

    .view2 {
        background-color: lightgray;
        width: auto;
        height: 44px;
        text-align: center; /* 在父容器里水平居中 inline 文字，或 inline 元素 */
        line-height: 44px; /* 与 height 联手，垂直居中文字 */
    }

    .view3 {
        background-color: white;
        width: auto;
        height: 44px;
        text-align: center; /* 在父容器里水平居中 inline 文字，或 inline 元素 */
        line-height: 44px; /* 与 height 联手，垂直居中文字 */
    }
</style>
