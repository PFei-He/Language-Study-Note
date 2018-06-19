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

#import "Code20180619.h"

@implementation Code20180619

// 串行队列
- (void)serialQueue
{
    /*
     serial queue（串行队列）特点：执行完队列中第一个任务，执行第二个任务，执行完第二个任务，执行第三个任务，以此类推，任何一个任务的执行，必须等到上个任务执行完毕。
     获得串行队列的方式有2种：
     1、获得 main queue：main queue 是主线程，即：主线程中执行队列中的各个任务
     2、创建 serial queue：serial queue 不在主线程中执行，系统会开辟一个子线程，在子线程中执行队列中的各个任务
     */
    
    
    // main queue
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第6个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第7个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第8个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第9个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第10个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    
    
    // serial queue  p.s. 苹果推荐使用反向域名格式定义队列名字
//    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第6个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第7个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第8个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第9个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第10个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
}

// 并行队列
- (void)concurrentQueue
{
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
     DISPATCH_QUEUE_PRIORITY_HIGH
     DISPATCH_QUEUE_PRIORITY_DEFAULT
     DISPATCH_QUEUE_PRIORITY_LOW
     DISPATCH_QUEUE_PRIORITY_BACKGROUND
     
     2、第二个参数是苹果预留参数，未来会用，目前填写为0。
     */
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第6个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第7个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第8个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第9个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第10个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    
    
    // concurrent queue
//    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第6个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第7个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第8个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第9个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第10个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
//    });
}

// 延迟执行
- (void)after
{
    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), queue, ^(void) {
        NSLog(@"任务执行完毕，所在线程：%@，是否是主线程: %d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
}

// 任务等待
- (void)wait
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 100; i++) {
        // 当线程收到信号时，才会继续向下执行，若没有收到信号，程序会永远的等待。
        NSLog(@"%ld", dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER));
        
        dispatch_group_async(group, queue, ^{
            NSLog(@"第%i个任务，所在线程%@，是否是主线程：%d", i, [NSThread currentThread], [[NSThread currentThread] isMainThread]);
            
            // 让程序睡眠3秒（延迟3秒）
            // sleep(3);
            [NSThread sleepForTimeInterval:3];
            
            // 给线程发送信号
            dispatch_semaphore_signal(semaphore);
        });
    }
    
    // 等待组任务全部完成
    NSLog(@"%ld", dispatch_group_wait(group, DISPATCH_TIME_FOREVER));
}

// 组任务
- (void)group
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 把不同任务归为一组
    dispatch_group_async(group, queue, ^{
        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    
    // 组任务结束
    dispatch_group_notify(group, queue, ^{
        NSLog(@"组任务执行完毕，所在线程：%@，是否是主线程: %d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
}

// 插入任务
- (void)barrier
{
    /*
     为了保证访问同一个数据时，数据的安全，我们可以使用serial queue解决数据安全访问的问题
     serial queue 的缺陷是：后面的任务必须等待前面的任务执行完毕才能执行
     对于往数据库写入数据，使用 serial queue 无疑能保证数据的安全
     对于从数据库中读取数据，使用 serial queue 就不太合适了，效率比较低。使用 concurrent queue 无疑是最合适的
     真实的项目中，通常既有对数据库的写入，又有数据库的读取，可以使用 barrier
     */
    
    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"第1个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第2个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第3个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第4个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第5个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_barrier_async(queue, ^{ // barrier 就像一道墙，之前的任务都并行执行，执行完毕之后，执行 barrier 中的任务，之后的任务也是并行执行。
        NSLog(@"写入数据，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第6个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第7个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第8个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第9个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第10个任务，所在线程：%@，是否是主线程：%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
}

// 多次执行
- (void)apply
{
    NSArray *array = @[@"1", @"2", @"3", @"4"];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(array.count, queue, ^(size_t index) {
        NSLog(@"第%@个任务，所在线程%@，是否是主线程：%d", array[index], [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    });
}

// 同步与异步
- (void)syncOrAsync
{
    dispatch_queue_t queue = dispatch_queue_create("top.faylib.gcd.queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 同步
    dispatch_sync(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"第%i个任务，所在线程%@，是否是主线程：%d", i, [NSThread currentThread], [[NSThread currentThread] isMainThread]);
        }
    });
    NSLog(@"任务执行完毕，所在线程：%@，是否是主线程: %d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    
    // 异步
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"第%i个任务，所在线程%@，是否是主线程：%d", i, [NSThread currentThread], [[NSThread currentThread] isMainThread]);
        }
    });
    NSLog(@"任务执行完毕，所在线程：%@，是否是主线程: %d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
}

@end
