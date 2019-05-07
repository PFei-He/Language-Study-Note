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

// 新建一个 Angular 实例
// var app = angular.module("Case1", []);

// 绑定 controller 控件，并设置 text 参数。$scope 为 Angular 预留参数，可理解为 Angular 的关键字。
// app.controller("controller", function ($scope) {
//     $scope.data = {
//         // 绑定的参数
//         text: "Hello World!"
//     }
// });



// 创建依赖模块
angular.module("Module", [])
    // 创建依赖
    .service("Service", function() {
        return {
            // 创建依赖方法
            say: function() {
                return "Hello World!";
            }
        };
    });

// 导入依赖模块 Module
angular.module("Case2", ["Module"])
    // 绑定 controller 控件，导入依赖
    .controller("controller", ["$scope", "Service", function($scope, Service) {
        $scope.data = {
            // 绑定的参数
            text: ""
        };
        $scope.say = function() {
            // 执行依赖方法
            $scope.data.text = Service.say();
        };
    }]);
