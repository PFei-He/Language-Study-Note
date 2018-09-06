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

function main() {
    console.log(versionComparison("0.0.21", "1.0.0"));
}

/* 版本对比 */
function versionComparison(currentVersion, serverVersion) {
   var currentVersionArray = separateString(currentVersion);
   var serverVersionArray = separateString(serverVersion);
   for (var i = 0; i < serverVersionArray.length; i++) {
      if(i > (currentVersionArray.length - 1)){
         return true;
     } else if (Number(serverVersionArray[i]) > Number(currentVersionArray[i])) {
         return true;
     } else if (Number(serverVersionArray[i]) < Number(currentVersionArray[i])) {
         return false;
     }
 }
}

/* 分离字符 */
function separateString(string) {
   string = replaceString(string, 2);
   var array = [];
   for (var i = 0; i < string.length; i++) {
      array.push(string[i]);
  }
  return array;
}

/* 替换字符 */
function replaceString(string, count) {
   if (count < 1) {
      return string;
  }
  string = string.replace(".", "");
  count--;
  return replaceString(string, count);
}

main();
