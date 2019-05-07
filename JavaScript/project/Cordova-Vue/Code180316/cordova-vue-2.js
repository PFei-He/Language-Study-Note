/**
 * Copyright (c) 2019 faylib.top
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// 自定义Android返回键为双击退出
window.document.addEventListener('backbutton', onBackKeyDown, false);
function onBackKeyDown () {
    Toast.showShort('再点击一次退出!');
    document.removeEventListener('backbutton', onBackKeyDown, false); // 注销返回键
    document.addEventListener('backbutton', exitApp, false); // 绑定退出事件
    // 2秒后重新注册
    var intervalID = window.setInterval(function () {
        window.clearInterval(intervalID);
        document.removeEventListener('backbutton', exitApp, false); // 注销返回键
        document.addEventListener('backbutton', onBackKeyDown, false) // 返回键
    }, 2000);
}

// 退出App
function exitApp () {
    navigator.app.exitApp();
}
