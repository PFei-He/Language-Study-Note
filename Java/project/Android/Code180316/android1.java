/**
 * Copyright (c) 2018 faylib.top
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
