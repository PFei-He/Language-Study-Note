/**
 * Created by fay on 2018/3/16.
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
