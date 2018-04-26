import android.view.KeyEvent;
import android.widget.Toast;

// 自定义Android返回键为双击退出
@Override
public boolean onKeyDown(int keyCode, KeyEvent event) {
    if (keyCode == KeyEvent.KEYCODE_BACK){
        exit();
        return false;
    }
    return super.onKeyDown(keyCode, event);
}

private void exit() {
    Timer timer;
    if (!isExit) {
        isExit = true; // 准备退出
        Toast.makeText(this, "再按一次退出程序", Toast.LENGTH_SHORT).show();
        timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                isExit = false; // 取消退出
            }
        }, 2000); // 如果2秒钟内没有按下返回键，则启动定时器取消掉刚才执行的任务
    } else {
        finish();
        System.exit(0);
    }
}
