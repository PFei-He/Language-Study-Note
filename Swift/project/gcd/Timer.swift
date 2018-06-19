//
//  Copyright (c) 2018 faylib.top
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

open class Timer: NSObject {
    
    // 单例
    private static let sharedInstance = Timer()
    
    // 计时器仓库
    private var timerContainer = [String: Any]()
    
    
    // MARK: Private Methods
    
    // 私有化初始化方法
    private override init() {}
    
    
    // MARK: Public Methods
    
    /**
     开始计时器
     - parameters:
        - name: 计时器名字
        - timeInterval: 超时时隔
        - queue: 所在线程
        - action: 执行的操作
     */
    open class func scheduled(name: String!, timeInterval: Double, queue: DispatchQueue?, action: @escaping () -> Void) {
        // 队列
        var queue = queue
        if queue == nil {
            queue = DispatchQueue.global(qos: .default)
        }
        
        // 计时器
        var timer = Timer.sharedInstance.timerContainer[name] as? DispatchSourceTimer
        if timer == nil {
            timer = DispatchSource.makeTimerSource(queue: queue)
            Timer.sharedInstance.timerContainer.updateValue(timer!, forKey: name)
        }
        timer?.schedule(deadline: .now(), repeating: timeInterval)
        timer?.setEventHandler(handler: action)
        timer?.resume()
    }
    
    /**
     开始计时器
     - parameters:
        - name: 计时器名字
        - timeInterval: 超时时隔
        - queue: 所在线程
        - repeat: 是否重复执行
        - action: 执行的操作
     */
    open class func scheduled(name: String!, timeInterval: Double, queue: DispatchQueue?, repeat: Bool, action: @escaping () -> Void) {
        if `repeat` { // p.s. 如果自定义变量名与 Swift 的关键字冲突，可以使用 `` 包裹变量名，这样就可以使用了
            Timer.scheduled(name: name, timeInterval: timeInterval, queue: queue, action: action)
        } else {
            // 队列
            var queue = queue
            if queue == nil {
                queue = DispatchQueue.global(qos: .default)
            }
            queue?.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(Int(timeInterval)), execute: action)
        }
    }
    
    /**
     暂停计时器
     - parameters:
        - name: 计时器名字
     */
    open class func suspend(name: String!) {
        guard let timer = Timer.sharedInstance.timerContainer[name] as? DispatchSourceTimer else {
            return
        }
        timer.suspend()
    }
    
    /**
     恢复计时器
     - parameters:
        - name: 计时器名字
     */
    open class func resume(name: String!) {
        guard let timer = Timer.sharedInstance.timerContainer[name] as? DispatchSourceTimer else {
            return
        }
        timer.resume()
    }
    
    /**
     删除计时器
     - parameters:
        - name: 计时器名字
     */
    open class func cancel(name: String!) {
        guard let timer = Timer.sharedInstance.timerContainer[name] as? DispatchSourceTimer else {
            return
        }
        Timer.sharedInstance.timerContainer.removeValue(forKey: name)
        timer.cancel()
    }
    
    /**
     判断计时器是否存在
     - parameters:
        - name: 计时器名字
     */
    open class func exist(name: String!) -> Bool {
        guard (Timer.sharedInstance.timerContainer[name] as? DispatchSourceTimer != nil) else {
            return false
        }
        return true
    }
}
