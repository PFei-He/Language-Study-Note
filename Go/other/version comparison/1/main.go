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

package main

import (
	"fmt"
	"strings"
)

func main()  {
	fmt.Println(compare("2.1.3b", "2.1.15a"))
}

func filling(s string) string {
	array := [5]string{"0000", "000", "00", "0", ""}
	ss := strings.Split(s, ".")
	for i := range ss {
		index := len(ss[i])
		ss[i] = array[index] + ss[i]
	}
	return strings.Join(ss, "")
}

func compare(clientVersion string, serverVersion string) string {
	client := filling(clientVersion)
	server := filling(serverVersion)

	if client > server {
		return client
	}

	if client < server {
		return server
	}

	return ""
}
