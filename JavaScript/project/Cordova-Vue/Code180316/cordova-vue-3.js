/**
 * Created by fay on 2018/3/16.
 */

// 自定义Android返回键为双击退出
document.addEventListener('backbutton', eventBackButton, false); // 返回键
document.addEventListener('menubutton', eventMenuButton, false); // 菜单键
document.addEventListener('searchbutton', eventSearchButton, false); // 搜索键
// 返回键
function eventBackButton () {
// confirm("再点击一次退出!")
    window.plugins.ToastPlugin.show_short('再点击一次退出!');
    document.removeEventListener('backbutton', eventBackButton, false); // 注销返回键
    // 3秒后重新注册
    var intervalID = window.setInterval(
        function () {
            window.clearInterval(intervalID);
            document.addEventListener('backbutton', eventBackButton, false) // 返回键
        },
        2000
    )
}

// 菜单键
function eventMenuButton () {
    window.plugins.ToastPlugin.show_short('点击了 菜单 按钮!');
}

// 搜索键
function eventSearchButton () {
    window.plugins.ToastPlugin.show_short('点击了 搜索 按钮!');
}
