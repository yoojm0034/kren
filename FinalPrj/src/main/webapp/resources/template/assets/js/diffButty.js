/*   MUST INCLUDE THIS IN SOURCE CODE OF DISTRIBUTION FILES
 *  
 *   DiffButty 1.0 (Completed 31st August 2010)
 *
 *   A javascript text file comparison utility
 *   for generating diffs between two text files.
 *
 *   (c) Copyright 2010 Julian Turner, Derby, United Kingdom
 *   http://www.baconbutty.com
 *
 *   Released under the MIT (X11) License. 
 *
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *   of this software and associated documentation files (the "Software"), to deal
 *   in the Software without restriction, including without limitation the rights
 *   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *   copies of the Software, and to permit persons to whom the Software is
 *   furnished to do so, subject to the following conditions:
 *
 *   The above copyright notice and this permission notice shall be included in
 *   all copies or substantial portions of the Software.
 *
 *   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *   THE SOFTWARE.
 */

/*   OPTIONAL EXPLANATORY TEXT
 *
 *   Uses an implementation of the LCS (longest common
 *   subsequence) algorithm located at
 *   http://en.wikipedia.org/wiki/Longest_common_subsequence_problem
 *
 *   Optimises the algorithm by progressively increasing the granularity.
 *
 *   Starts by examing whole lines, and if different, examining  
 *   whole words, and if different, examining chars.
 *
 *   Consists of a single function "diffButty()".  All other functions
 *   are nested within.
 *
 *   To use, call the function "diffButty(<oldString>, <newString>)", 
 *   and it will return a simple html string with the differences contained
 *   in <ins> and <del> html tags.
 */
function diffButty(
	o /*: String*/,
	n /*: String*/
) /*: String*/
{
	// VERSION 1.0
	// (c) Copyright Julian Turner 2010

	var MATCH /*: int*/ = 0;
	var INS /*: int*/ = 1;
	var DEL /*: int*/ = 2;

	return processResult(processLines(o, n));

	// NESTED FUNCTIONS FOLLOW
function processLines(
	o /*: String*/,
	n /*: String*/
) /*: Array.<Object.<String, int>>*/
{
	var result /*: Array.<Object.<String, int>>*/ = [];
	var diff /*: Array.<Object.<String, int>>*/ = [];
	var item /*: Object.<String, int>*/;

	var a /*: Array.<String>*/;
	var b /*: Array.<String>*/;
	var c /*: Array.<Array.<int>>*/;

	var suba /*: String*/ = "";
	var subb /*: String*/ = "";
	var subd /*: Array.<Object.<String, int>>*/ = [];

	a = splitByLine(o);
	b = splitByLine(n);

	c = calculateLCS(a, b);

	diff = readoutDiff(c, a, b, a.length - 1, b.length - 1);

	for (var i /*: int*/ = 0; i < diff.length; i++)
	{
		item = diff[i];

		if (item.type == MATCH)
		{
			if (suba && !subb)
			{
				result.push({str : suba, type : DEL});
			}
			else if (!suba && subb)
			{
				result.push({str : subb, type : INS});
			}
			else if (suba && subb)
			{
				subd = processWords(suba, subb);
				//result = result.concat(subd);
				Array.prototype.push.apply(result, subd);
			}

			suba = "";
			subb = "";

			result.push(item);
			continue;
		}
		else if (item.type == INS)
		{
			subb += item.str;
		}
		else if (item.type == DEL)
		{
			suba += item.str;
		}
	}

	if (suba && !subb)
	{
		result.push({str : suba, type : DEL});
	}
	else if (!suba && subb)
	{
		result.push({str : subb, type : INS});
	}
	else if (suba && subb)
	{
		subd = processWords(suba, subb);
		//result = result.concat(subd);
		Array.prototype.push.apply(result, subd);
	}

	return result;
}
function processWords(
	o /*: String*/,
	n /*: String*/
) /*: Array.<Object.<String, int>>*/
{

	var result /*: Array.<Object.<String, int>>*/ = [];
	var diff /*: Array.<Object.<String, int>>*/ = [];
	var item /*: Object.<String, int>*/;

	var a /*: Array.<String>*/;
	var b /*: Array.<String>*/;
	var c /*: Array.<Array.<int>>*/;

	var lcs /*: int*/ = 0;

	var suba /*: String*/ = "";
	var subb /*: String*/ = "";
	var subd /*: Array.<Object.<String, int>>*/ = [];

	a = splitByWord(o);
	b = splitByWord(n);

	c = calculateLCS(a, b);

	lcs = c[a.length - 1][b.length - 1];

	if (lcs < 2)
	{
		return [{str : n, type : INS}, {str : o, type : DEL}];
	}

	diff = readoutDiff(c, a, b, a.length - 1, b.length - 1);

	for (var i /*: int*/ = 0; i < diff.length; i++)
	{
		item = diff[i];

		if (item.type == MATCH)
		{
			if (suba && !subb)
			{
				result.push({str : suba, type : DEL});
			}
			else if (!suba && subb)
			{
				result.push({str : subb, type : INS});
			}
			else if (suba && subb)
			{
				subd = processChars(suba, subb);
				//result = result.concat(subd);
				Array.prototype.push.apply(result, subd);
			}

			suba = "";
			subb = "";

			result.push(item);
			continue;
		}
		else if (item.type == INS)
		{
			subb += item.str;
		}
		else if (item.type == DEL)
		{
			suba += item.str;
		}
	}

	if (suba && !subb)
	{
		result.push({str : suba, type : DEL});
	}
	else if (!suba && subb)
	{
		result.push({str : subb, type : INS});
	}
	else if (suba && subb)
	{
		subd = processChars(suba, subb);
		//result = result.concat(subd);
		Array.prototype.push.apply(result, subd);
	}

	return result;
}
function processChars(
	o /*: String*/,
	n /*: String*/
) /*: Array.<Object.<String, int>>*/
{
	var a /*: Array.<String>*/;
	var b /*: Array.<String>*/;
	var c /*: Array.<Array.<int>>*/;

	var lcs /*: int*/ = 0;

	if (!o)
	{
		return [{str : n, type : INS}];
	}

	if (!n)
	{
		return [{str : o, type : DEL}];
	}

	a = o.split("");
	b = n.split("");

	c = calculateLCS(a, b);

	lcs = c[a.length - 1][b.length - 1];

	if (lcs < 3)
	{
		return [{str : n, type : INS}, {str : o, type : DEL}];
	}
	else
	{
		return readoutDiff(c, a, b, a.length - 1, b.length - 1);
	}
}
function processResult(
	diff /*: Array.<Object.<String, int>>*/
) /*: String*/
{
	var item /*: Object.<String, int>*/;
	var html /*: Array.<String>*/ = [];

	for (var i /*: int*/ = 0; i < diff.length; i++)
	{
		item = diff[i];

		switch(item.type)
		{
			default:
			case MATCH:
				match(item.str);
				break;

			case INS:
				ins(item.str);
				break;

			case DEL:
				del(item.str);
				break;
		}
	}

	return html.join("");

	function match(s /*: String*/) /*: void*/
	{
		if (!s) { return; }
		s = escapeHTML(s);
		html.push(s);
	}

	function ins(s /*: String*/) /*: void*/
	{
		if (!s) { return; }
		s = "<ins style='color:#3d70b2; font-family:ONE-Mobile-Regular'>" + escapeHTML(s) + "</ins>";
		html.push(s);
	}

	function del(s /*: String*/) /*: void*/
	{
		if (!s) { return ""; }
		s = "<del style='color:#e03b3b; font-family:ONE-Mobile-Regular'>" + escapeHTML(s) + "</del>";
		html.push(s);
	}

	function escapeHTML(s /*: String*/) /*: String*/
	{
		return s.replace(/\&/gi,"&amp;").replace(/</gi,"&lt;").replace(/>/gi,"&gt;");
	}
}
function calculateLCS(
	a /*: Array.<String>*/,
	b /*: Array.<String>*/
) /*: Array.<Array.<int>>*/
{
	// Store the array that stores the substrings found
	var c /*: Array.<Array.<int>>*/ = [];

	// Make string start at index 1
	a.unshift(" "); 
	b.unshift(" ");

	// Initialise the first row
	for (var i /*: int*/ = 0; i < a.length; i++)
	{
		c[i] = [];
		c[i][0] = 0;
	}

	// Initialise the first column
	for (var j /*: int*/ = 0; j < b.length; j++)
	{
		c[0][j] = 0;
	}

	// Calculate the diff
	for (var i /*: int*/ = 1; i < a.length; i++)
	{
		for (var j /*: int*/ = 1; j < b.length; j++)
		{
			if (a[i] == b[j])
			{
				c[i][j] = c[i - 1][j - 1] + 1;
			}
			else
			{
				c[i][j] = Math.max(c[i][j - 1], c[i - 1][j]);

			}
		}
	}

	return c;
}
function readoutDiff(
	c /*: Array.<Array.<int>>*/,
	a /*: Array.<String>*/,
	b /*: Array.<String>*/,
	i /*: int*/, 
	j /*: int*/
) /*: Array.<Object.<String, int>>*/
{
	var diff /*: Array.<Object.<String, int>>*/ = [];

	function recurse(i, j)
	{
		if (i > 0 && j > 0 && a[i] == b[j])
		{
			recurse(i - 1, j - 1);
			diff.push({str : a[i], type : MATCH});
		}
		else
		{
			if (j > 0 && (i == 0 || c[i][j - 1] >= c[i - 1][j]))
			{
				recurse(i, j - 1);
				diff.push({str : b[j], type : INS});
			}
			else if (i > 0 && (j == 0 || c[i][j - 1] < c[i - 1][j]))
			{
				recurse(i - 1, j);
				diff.push({str : a[i], type : DEL});
			}	
		}
	}

	recurse(i, j);

	return diff;
}
function splitByLine(
	s /*: String*/
) /*: Array.<String>*/
{
	var lines /*: Array.<String>*/;
	var re /*: RegExp*/ = /([^\r\n]+$|[^\r\n]*(\r\n|\r|\n))/g;
	lines = s.match(re);
	if (!lines) { lines = []; }
	return lines;
}
function splitByWord(
	s /*: String*/
) /*: Array.<String>*/
{
	var words /*: Array.<String>*/;
	var re /*: RegExp*/ = /([ \t\r\n]+|[^ \t\r\n\w]+|\w+)/g;
	words = s.match(re);
	if (!words) { words = []; }
	return words;
}
	// DiffButty 1.0 End
}