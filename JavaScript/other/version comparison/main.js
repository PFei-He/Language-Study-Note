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
