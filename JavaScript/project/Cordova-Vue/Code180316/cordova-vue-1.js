/**
 * Created by fay on 2018/3/16.
 */

// 自定义Android返回键为双击退出
window.document.addEventListener('backbutton', shutdown, false);
var beginDate; // 两次点击退出按钮开始时间
var isToast = false; // 是否弹出弹框
// 点击退出按钮
function shutdown () {
    var endDate = new Date().getTime(); // 两次点击退出按钮结束时间

    // 提示过Toast并且两次点击时间小于2S
    if (isToast && endDate - beginDate < 2000) {
        beginDate = endDate;
        isToast = false;
        navigator.app.exitApp()
    } else Toast('再次点击退出程序', 2000);
}

// 自定义弹框，2s消失
function Toast (msg, duration) {
    isToast = true;
    beginDate = new Date().getTime();
    duration = isNaN(duration) ? 2000 : duration; // duration是不是一个数字
    var m = document.createElement('div');
    m.innerHTML = msg;
    m.style.cssText = 'width:60%; min-width:150px; background:#000; opacity:0.5; height:40px; color:#fff; line-height:40px; text-align:center; border-radius:5px; position:fixed; top:80%; left:20%; z-index:999999; font-weight:bold;';
    document.body.appendChild(m);
    setTimeout(function () {
        var d = 0.5;
        m.style.webkitTransition = '-webkit-transform ' + d + 's ease-in, opacity ' + d + 's ease-in';
        m.style.opacity = '0';
        setTimeout(function () { document.body.removeChild(m) }, d * 1000)
    }, duration);
}
