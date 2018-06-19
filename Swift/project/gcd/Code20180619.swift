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

class Code20180619: NSObject {
    // 串行队列
    func serialQueue() {
        /*
         serial queue（串行队列）特点：执行完队列中第一个任务，执行第二个任务，执行完第二个任务，执行第三个任务，以此类推，任何一个任务的执行，必须等到上个任务执行完毕。
         获得串行队列的方式有两种：
         1、获得 main queue：main queue 是主线程，即：主线程中执行队列中的各个任务
         2、创建 serial queue：serial queue 不在主线程中执行，系统会开辟一个子线程，在子线程中执行队列中的各个任务
         */
        
        
        // main queue
        let queue = DispatchQueue.main
        queue.async {
            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第6个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第7个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第8个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第9个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第10个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        
        
        // serial queue  p.s. 苹果推荐使用反向域名格式定义队列名字
//        let queue = DispatchQueue(label: "top.faylib.gcd.queue")
//        queue.async {
//            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第6个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第7个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第8个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第9个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第10个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
    }
    
    // 并行队列
    func concurrentQueue() {
        /*
         concurrent queue（并行队列）特点：队列中的任务，第一个先执行，不等第一个执行完毕，第二个就开始执行了，不等第二个任务执行完毕，第三个就开始执行了，以此类推。后面的任务执行的晚，但是不会等前面的执行完才执行。
         获得并行队列的方式有两种：
         1、获得 global queue
         2、创建 concurrent queue
         
         p.s. 系统会根据需要开辟若干个线程，并行执行队列中的任务（开始较晚的任务未必最后结束，开始较早的任务未必最先完成），开辟的线程数量取决于多方面因素，比如：任务的数量，系统的内存资源等等，会以最优的方式开辟线程。
         */
        
        
        // global queue
        /*
         1、第一个参数控制队列的优先级，一共有4个优先级：
         userInitiated
         default
         utility
         background
         
         2、第二个参数是苹果预留参数，未来会用，目前填写为0。
         */
        let queue = DispatchQueue.global(qos: .default)
        queue.async {
            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第6个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第7个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第8个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第9个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第10个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        
        
        // concurrent queue
//        let queue = DispatchQueue(label: "top.faylib.gcd.queue", attributes: .concurrent)
//        queue.async {
//            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第6个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第7个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第8个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第9个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
//        queue.async {
//            print("第10个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
//        }
    }
    
    // 延迟执行
    func after() {
        let queue = DispatchQueue(label: "top.faylib.gcd.queue", attributes: .concurrent)
        queue.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(Int(3.0)), execute: {
            print("任务执行完毕，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
    }
    
    // 任务等待
    func wait() {
        let group = DispatchGroup()
        let semaphore = DispatchSemaphore(value: 10)
        let queue = DispatchQueue.global(qos: .default)
        for i in 0..<100 {
            // 当线程收到信号时，才会继续向下执行，若没有收到信号，程序会永远的等待。
            print(semaphore.wait(timeout: .distantFuture))
            
            queue.async(group: group, execute: DispatchWorkItem {
                print("第\(i)个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
                
                // 让程序睡眠3秒（延迟3秒）
                // sleep(3)
                Thread.sleep(forTimeInterval: 3)
                
                // 给线程发送信号
                semaphore.signal()
            })
        }
        
        // 等待组任务全部完成
        print(group.wait(timeout: .distantFuture))
    }
    
    // 组任务
    func group() {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "top.faylib.gcd.queue", attributes: .concurrent)
        
        // 把不同任务归为一组
        queue.async(group: group, execute: DispatchWorkItem {
            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
        queue.async(group: group, execute: DispatchWorkItem {
            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
        queue.async(group: group, execute: DispatchWorkItem {
            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
        queue.async(group: group, execute: DispatchWorkItem {
            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
        queue.async(group: group, execute: DispatchWorkItem {
            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
        
        // 组任务结束
        group.notify(queue: queue, work: DispatchWorkItem {
            print("组任务执行完毕，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        })
    }
    
    // 插入任务
    func barrier() {
        /*
         为了保证访问同一个数据时，数据的安全，我们可以使用serial queue解决数据安全访问的问题
         serial queue 的缺陷是：后面的任务必须等待前面的任务执行完毕才能执行
         对于往数据库写入数据，使用 serial queue 无疑能保证数据的安全
         对于从数据库中读取数据，使用 serial queue 就不太合适了，效率比较低。使用 concurrent queue 无疑是最合适的
         真实的项目中，通常既有对数据库的写入，又有数据库的读取，可以使用 barrier
         */
        
        let queue = DispatchQueue(label: "top.faylib.gcd.queue.", attributes: .concurrent)
        queue.async {
            print("第1个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第2个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第3个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第4个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第5个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async(flags: .barrier) { // barrier 就像一道墙，之前的任务都并行执行，执行完毕之后，执行 barrier 中的任务，之后的任务也是并行执行。
            print("写入数据，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第6个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第7个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第8个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第9个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
        queue.async {
            print("第10个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        }
    }
    
    // 多次执行
    func apply() {
        let array = ["1", "2", "3", "4"]
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.concurrentPerform(iterations: array.count) { (index) in
                print("第\(array.count)个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
            }
        }
    }
    
    // 同步与异步
    func syncOrAsync() {
        let queue = DispatchQueue(label: "top.faylib.gcd.queue", attributes: .concurrent)
        
        // 同步
        queue.sync {
            for i in 0..<10 {
                print("第\(i)个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
            }
        }
        print("任务执行完毕，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
        
        // 异步
        queue.async {
            for i in 0..<10 {
                print("第\(i)个任务，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
            }
        }
        print("任务执行完毕，所在线程：\(Thread.current)，是否是主线程：\(Thread.current.isMainThread)")
    }
}
