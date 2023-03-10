"use strict"
// alert("I'm JavaScript!");

// let admin;
// let name = "John";
// admin = name;
// alert(admin);

// alert(1/0);
// let agetest = 19;
// alert(`My age is ${agetest}`);

// let age = null;
/*In JavaScript, null is not a “reference to a non-existing object” or a “null pointer” like in some other languages.
It’s just a special value which represents “nothing”, “empty” or “value unknown”.
The code above states that age is unknown or empty for some reason.*/
// alert(typeof(110));

// let name = "Ilya";
// alert( `hello ${1}` ); // 1
// alert( `hello ${"name"}` ); // name
// alert( `hello ${name}` ); // Ilya

// alert(1 + "a");
// alert(1 + "2");

/*undefined is NaN as a number, not 0.
"0" and space-only strings like " " are true as a boolean.*/
// alert( Boolean("0") ); // true
// alert( Boolean(" ") ); // spaces, also true (any non-empty string is true)

// alert("" + 1 + 0);      //10
// alert("" - 1 + 0);      //-1
// alert(true + false);    //1
// alert(6 / "3");         //2
// alert("2" * "3");       //23        6
// alert(4 + 5 + "px");    //45px      9px
// alert("$" + 4 + 5);     //$45
// alert("4" - 2);         //2
// alert("4px" - 2);       //nan
// alert(7 / 0);           //infinity
// alert("  -9  " + 5);    //-95       -9 5
// alert("  -9  " - 5);    //-14
// alert(null + 1);        //1
// alert(undefined + 1);   //nan

// let a = 0;
// alert( Boolean(a) ); // false

// let b = "0";
// alert( Boolean(b) ); // true

// alert(a == b); // true!

// let name = prompt("What's your name?","Michael");
// alert(`Hello ${name}`);

// let year = prompt("What is his name.", " ");
// if (year === "Michael")
// {
//     alert("your are right");
// }
// else
// {
//     alert("your are wrong");
// }

// let ans = prompt('What is the "official" name of JavaScript', "");
// if (ans === "ECMAScript")
// {
//     alert("right");
// } else
// {
//     alert('Your don\'t konw? "ECMAScript"!');
// }

// let num = prompt("Input number:");

// if (num > 0)
// {
//     alert(1);
// }
// else if (num < 0)
// {
//     alert(-1);
// }
// else if (Number(num) == 0)
// {
//     alert(0);
// }

// let result = (a + b < 4) ? "Below" : "Over";
// let login = prompt("Who are you ?");
// let message =
//     (login == "Employee") ? "Hello" :
//         (login == "Director") ? "Greeting" :
//             (login == "") ? "No login" :
//                 "";
// alert(message);

// switch (browser) {
//     case 'Edge':
//       alert( "You've got the Edge!" );
//       break;

//     case 'Chrome':
//     case 'Firefox':
//     case 'Safari':
//     case 'Opera':
//       alert( 'Okay we support these browsers too' );
//       break;

//     default:
//       alert( 'We hope that this page looks ok!' );
//   }

//   if (browse==='Edge') {
//     alert( "You've got the Edge!" );
//   }else if(browse==='Chrome'||browse==='Firefox'||browse==='Safari'||browse==='Opera')
//   {
//     alert( 'Okay we support these browsers too' );
//   }else{
//     alert( 'We hope that this page looks ok!' );
//   }

// let a = +prompt('a?', '');

// if (a == 0) {
//   alert( 0 );
// }
// if (a == 1) {
//   alert( 1 );
// }

// if (a == 2 || a == 3) {
//   alert( '2,3' );
// }

// let a = +prompt('a?', '');
// switch (a)
// {
//     case 0:
//         alert(0);
//         break;
//     case 1:
//         alert(1);
//         break;
//     case 2:
//     case 3:
//         alert('2,3');
//         break;
// }

// Aroow Function
// function ask (question, yes, no)
// {
//     if (confirm(question)) yes()
//     else no();
// }

// ask(
//     "Do you agree?",
//     () => alert("You agreed."),
//     () => alert("You canceled the execution.")
// );

// /**
//  * function document comment
//  * @param {test params} params
//  */
// function foo(params) {
// }

// console.log("Hello World!");

// let user = {
//     name: "Michael",
//     age: 18,
//     score: 10,
//     money: 1000,
//     isAdmin: true,
//     "49": "Germany",
//     "41": "Switzerland",
//     "+44": "Great Britain",
// };

// for (let key in user)
// {
//     console.log(`key:${key},\tvalue:${user[key]}`);
// }

// let user = {};
// user.name = "John";
// user.surname = "Smith";
// user.name = "Pete";
// delete user.name;

// function isEmpty(obj) {
//     for(let key in obj)
//     {
//         return false;
//     }
//     return true;
// }

// let salaries = {
//     John: 100,
//     Ann: 160,
//     Pete: 130
// }

// function sumSalaries(salary) {
//     let res = 0

//     for(let key in salary)
//     {
//         res += salary[key];
//     }

//     return res;
// }

// let sum = sumSalaries(salaries);
// alert(sum);

// let menu = {
//     width: 200,
//     height: 300,
//     title: "My menu"
// };

// for (const key in menu)
// {
//     if (typeof menu[key] == "number")
//     {
//         menu[key] *= 2
//     }
// }

// for (const key in menu)
// {
//     console.log(`key:${key},value:${menu[key]}`);
// }

// let id1 = Symbol("id");
// let id2 = Symbol("id");
// alert(id1 === id2);

// let id3 = Symbol.for("id");
// let id4 = Symbol.for("id");
// alert(id3 === id4);

// alert(Symbol.keyFor(id3));

// let user =
// {
//     name: "John",
//     money: 1000,
//     toString ()
//     {
//         return this.name;
//     },
//     valueOf ()
//     {
//         return this.money;
//     }
// }

// alert(user);
// alert(+user);
// alert(user + 500);

// function Calculator ()
// {
//     this.read = () =>
//     {
//         this.valueA = prompt("a?");
//         this.valueB = prompt("b?");
//     };
//     this.sum = () =>
//     {
//         return Number(this.valueA) + Number(this.valueB);
//     }
//     this.mul = () =>
//     {
//         return Math.abs(this.valueA - this.valueB);
//     }
// }

// let calculator = new Calculator();
// calculator.read();
// alert("Sum = " + calculator.sum());
// alert("Mul = " + calculator.mul());

// function readNumber (params)
// {
//     while (true)
//     {
//         let val = prompt("Input a number please?");

//         if (isFinite(val))
//         {
//             alert(val);
//             return val;
//         }
//         if (val == null || val == "")
//         {
//             alert(val);
//             return null;
//         }
//     }
// }

// readNumber();

// function random (min, max)
// {
//     return Math.floor(Math.random() * (max - min + 1) + min);
// }

// alert(random(1, 5));
// alert(random(1, 5));
// alert(random(1, 5));

// let str = "";
// for (let i = 65; i <= 220; i++)
// {
//     str += String.fromCodePoint(i);
// }
// alert(str);

// function ucFirst (str)
// {
//     if (String(str).length == 0)
//     {
//         return "";
//     }
//     else
//     {
//         let f = str[0];
//         let fu = String(f).toUpperCase();
//         let last = String(str).slice(1, String(str).length);
//         return fu + last;
//     }
// }

// function ucFirst2 (str)
// {
//     if (!str)
//     {
//         return str;
//     }
//     return str[0].toUpperCase() + str.slice(1);
// }

// alert(ucFirst2("john"));

// function checkSpam (str)
// {
//     let lowerStr = String(str).toLowerCase();
//     if (String(lowerStr).includes("viagra") || String(lowerStr).includes("xxx"))
//     {
//         return true;
//     }
//     return false;
// }

// alert(checkSpam('buy ViAgRA now'));
// alert(checkSpam('free xxXxx'));
// alert(checkSpam('innocent rabbit'));

// let arr = ["Jazz", "Blues"];
// arr.push("Rock-n-Roll");
// arr[Math.floor(arr.length / 2)] = "Classics";
// arr.shift();
// arr.unshift("Rap,Reggae");

// let arr = ["a", "b"];
// arr.push(function ()
// {
//     alert(this);
// });
// arr[2]();

// function sumInput (params)
// {
//     let arr = [];
//     while (true)
//     {
//         let input = prompt("input number:");
//         if (input == null || input == "" || isNaN(input))
//         {
//             break;
//         }
//         arr.push(+input);
//     }
//     let sum = 0;
//     for (let i = 0; i < arr.length; i++)
//     {
//         sum += arr[i];
//     }
//     return sum;
// }

// alert(sumInput());

// function getMaxSubSum (arr)
// {
//     let sums = [];
//     for (let i = 0; i < arr.length; i++)
//     {
//         let sum = 0;
//         for (let j = i; j < arr.length; j++)
//         {
//             sum += arr[j];
//             sums.push(sum);
//         }
//     }
//     let max = 0;
//     for (let i = 0; i < sums.length; i++)
//     {
//         if (sums[i] > max)
//         {
//             max = sums[i];
//         }
//     }
//     return max;
// }

// function getMaxSunSumOptimize (arr)
// {
//     let sum = 0;
//     let max = 0;
//     for (let i = 0; i < arr.length; i++)
//     {
//         sum += arr[i];
//         if (sum < 0)
//         {
//             sum = 0;
//         }
//         if (sum > max)
//         {
//             max = sum;
//         }
//     }
//     return sum;
// }

// let input = [100, -9, 2, -3, 5];
// alert(getMaxSunSumOptimize(input));

// let arr = [1, 2, 5];
// arr.splice(-1, 0, 3, 4);
// alert(arr);

// arr.forEach(alert);

// function camelize (str)
// {
//     let arr = str.split('-');
//     for (let i = 1; i < arr.length; i++)
//     {
//         arr[i] = String(arr[i]).charAt(0).toUpperCase() + String(arr[i]).substring(1);
//     }
//     return arr.join("");
// }

// function camelize (str)
// {
//     return str
//         .split('-')
//         .map((item, index) => item = index == 0 ? item : item[0].toUpperCase() + item.slice(1))
//         .join('');
// }

// alert(camelize("list-style-image"));

// function filterRange (arr, a, b)
// {
//     return arr.filter(item => (item >= a && item <= b));
// }

// function filterRangeInPlace (arr, a, b)
// {
//     let arrs = arr.filter(item => (item >= a && item <= b));
//     arr.length = 0;
//     for (let i = 0; i < arrs.length; i++)
//     {
//         arr.push(arrs[i]);
//     }
//     return arrs;
// }

// function filterRangeInPlace (arr, a, b)
// {
//     for (let i = 0; i < arr.length; i++)
//     {
//         let val = arr[i];
//         // remove if outside of the interval
//         if (val < a || val > b)
//         {
//             arr.splice(i, 1);
//             i--;
//         }
//     }
// }

// let arr = [5, 3, 8, 1];
// alert(filterRangeInPlace(arr, 1, 4));

// let arr = [5, 2, 1, -10, 8];

// for (let i = 0; i < arr.length - 1; i++)
// {
//     for (let j = i; j < arr.length - 1; j++)
//     {
//         if (arr[j] < arr[j + 1])
//         {
//             let tem = arr[j];
//             arr[j] = arr[j + 1];
//             arr[j + 1] = tem;
//         }
//     }
// }

// arr.sort((a, b) => (b - a));

// alert(arr); // 8, 5, 2, 1, -10

// function copySorted (str)
// {
//     let res = str.filter(item => item);
//     res.sort();
//     return res;
// }

// let arr = ["HTML", "JavaScript", "CSS"];
// let sorted = copySorted(arr);

// alert(sorted); // CSS, HTML, JavaScript
// alert(arr); // HTML, JavaScript, CSS (no changes)

// function Calculator ()
// {
//     this.calculate = function (str)
//     {
//         let arr = str.split(" ");
//         if (this.hasOwnProperty(arr[1]) || isNaN(arr[0] || isNaN(arr[2])))
//         {
//             return this[arr[1]](arr[0], arr[2]);
//         }
//         else
//         {
//             return NaN;
//         }
//     }
//     this["+"] = function (a, b)
//     {
//         return Number(a) + Number(b);
//     }
//     this.addMethod = function (str, method)
//     {
//         this[str] = method;
//     }
// }

// function Calculator ()
// {
//     let methods = {
//         "-": (a, b) => a - b,
//         "+": (a, b) => a + b
//     };
//     this.calculate = function (str)
//     {
//         let split = str.split(' '),
//             a = +split[0],
//             op = split[1],
//             b = +split[2]

//         if (!methods[op] || isNaN(a) || isNaN(b))
//         {
//             return NaN;
//         }
//         return methods[op](a, b);
//     }
//     this.addMethod = function (name, func)
//     {
//         methods[name] = func;
//     };
// }

// let calculate = new Calculator();
// calculate.addMethod("*", (a, b) => a * b);
// calculate.addMethod("/", (a, b) => a / b);
// calculate.addMethod("**", (a, b) => a ** b);
// alert(calculate.calculate("2 - 3"));

// let john = { name: "John", age: 25 };
// let pete = { name: "Pete", age: 30 };
// let mary = { name: "Mary", age: 28 };

// let users = [john, pete, mary];

// let names = users.map(item => item.name);

// alert(names); // John, Pete, Mary

// let john = { name: "John", surname: "Smith", id: 1 };
// let pete = { name: "Pete", surname: "Hunt", id: 2 };
// let mary = { name: "Mary", surname: "Key", id: 3 };

// let users = [john, pete, mary];

// let usersMapped = users.map(user => ({ fullName: user.name + " " + user.surname, id: user.id }));

/*
usersMapped = [
  { fullName: "John Smith", id: 1 },
  { fullName: "Pete Hunt", id: 2 },
  { fullName: "Mary Key", id: 3 }
]
*/

// alert(usersMapped[0].id) // 1
// alert(usersMapped[0].fullName) // John Smith

// function unique (arr)
// {
//     let set = new Set();
//     for (let i = 0; i < arr.length; i++)
//     {
//         set.add(arr[i]);
//     }
//     return Array.from(set);
// }

// function unique (arr)
// {
//     return Array.from(new Set(arr));
// }

// let values = ["Hare", "Krishna", "Hare", "Krishna",
//     "Krishna", "Krishna", "Hare", "Hare", ":-O"
// ];

// alert(unique(values)); // Hare, Krishna, :-O

// let arr = ["nap", "teachers", "cheaters", "PAN", "ear", "era", "hectares"];

// function aclean (arr)
// {
//     let map = new Map();
//     for (let i = 0; i < arr.length; i++)
//     {
//         let str = Array.from(arr[i]).sort().join("").toLowerCase();
//         map.set(str, arr[i]);
//     }
//     return Array.from(map.values());
// }

// alert(aclean(arr)); // "nap,teachers,ear" or "PAN,cheaters,era"

// let map = new Map();

// map.set("name", "John");

// let keys = Array.from(map.keys());

// // Error: keys.push is not a function
// keys.push("more");
// alert(keys);

// let salaries = {
//     "John": 100,
//     "Pete": 300,
//     "Mary": 250
// };

// function sumSalaries (salary)
// {
//     return Object.values(salary).reduce((sum,item)=>sum+item,0);
// }

// alert(sumSalaries(salaries)); // 650

// let user = {
//     name: 'John',
//     age: 30
// };

// function count (obj)
// {
//     return Object.keys(obj).length;
// }

// alert(count(user)); // 2

// let user = { name: "John", years: 30 };

// // your code to the left side:
// let { name, years: age, isAdmin = false } = user

// alert(name); // John
// alert(age); // 30
// alert(isAdmin); // false

// let salaries = {
//     "John": 100,
//     "Pete": 300,
//     "Mary": 250
// };

// function topSalary (salaries)
// {
//     let maxName = null;
//     let max = 0;
//     for (const [name, salary] of Object.entries(salaries))
//     {
//         if (max < salary)
//         {
//             max = salary;
//             maxName = name;
//         }
//     }
//     return maxName;
// }

// alert(topSalary(salaries));

// let now = new Date();
// alert(now);

// let time = new Date(2012, 1, 20, 3, 12);
// alert(time);

// let date = new Date(2012, 0, 3);  // 3 Jan 2012
// function getWeekDay (date)
// {
//     switch (date.getDay())
//     {
//         case 0:
//             return 'SU';
//         case 1:
//             return 'MO';
//         case 2:
//             return 'TU';
//         case 3:
//             return 'WE';
//         case 4:
//             return 'TH';
//         case 5:
//             return 'FR';
//         case 6:
//             return 'SA';
//         default:
//             break;
//     }
// }
// alert(getWeekDay(date));        // should output "TU"

// let date = new Date(2012, 0, 3);  // 3 Jan 2012

// function getLocalDay (date)
// {
//     switch (date.getDay())
//     {

//         case 1:
//             return 'MO';
//         case 2:
//             return 'TU';
//         case 3:
//             return 'WE';
//         case 4:
//             return 'TH';
//         case 5:
//             return 'FR';
//         case 6:
//             return 'SA';
//         case 7:
//             return 'SU';
//     }
// }

// alert(getLocalDay(date));       // tuesday, should show 2

// let date = new Date(2015, 0, 2);
// function getDateAgo (d, day)
// {
//     let date = new Date(d);
//     return new Date(date.setDate(date.getDate() - day));
// }
// alert(getDateAgo(date, 1)); // 1, (1 Jan 2015)
// alert(getDateAgo(date, 2)); // 31, (31 Dec 2014)
// alert(getDateAgo(date, 365)); // 2, (2 Jan 2014)

// function getLastDayOfMonth (year, month)
// {
//     let date = new Date(year, month);
//     date.setMonth(date.getMonth() + 1);
//     date.setDate(0);
//     return date.getDate();
// }

// function getLastDayOfMonth (year, month)
// {
//     let date = new Date(year, month + 1, 0);
//     return date.getDate();
// }

// alert(getLastDayOfMonth(2012, 1));

// function getSecondsToday (date)
// {
//     let start = new Date(date);
//     start.setHours(0);
//     return (date - start) / 1000;
// }
// alert(getSecondsToday(new Date(2019, 4, 25, 10)));

// let user = {
//     name: "John Smith",
//     age: 35
// };
// let json = JSON.stringify(user);
// alert(json);
// let userBack = JSON.parse(json);
// alert(userBack.name);

// let room = {
//     number: 23
// };

// let meetup = {
//     title: "Conference",
//     occupiedBy: [{ name: "John" }, { name: "Alice" }],
//     place: room
// };

// // circular references
// room.occupiedBy = meetup;
// meetup.self = meetup;

// alert(JSON.stringify(meetup, function replacer (key, value)
// {
//     return (key != "" && value == meetup) ? undefined : value;
// }));

/* result should be:
{
  "title":"Conference",
  "occupiedBy":[{"name":"John"},{"name":"Alice"}],
  "place":{"number":23}
}
*/

// function sumTo (n) { /*... your code ... */ }
// function sumTo (n)
// {
//     if (n == 1)
//     {
//         return n;
//     }
//     else
//     {
//         return n + sumTo(n - 1);
//     }
// }
// alert(sumTo(100)); // 5050

// function fib (n) { /* your code */ }

// function fib (n)
// {
//     if (n == 1)
//     {
//         return 1;
//     }
//     else if (n == 2)
//     {
//         return 1;
//     }
//     else
//     {
//         return fib(n - 1) + fib(n - 2)
//     }
// }

// alert(fib(3)); // 2
// alert(fib(7)); // 13
// alert(fib(77)); // 5527939700884757

// let h = "HelloWorld!";

// function testRest (title, ...rest)
// {
//     return rest.reduce((res, item) => (res + item), title);
// }

// alert(testRest("test", ...h));

// function makeWorker ()
// {
//     let name = "Pete";
//     return function ()
//     {
//         alert(name);
//     }
// }
// let name = "John";
// let worker = makeWorker();
// worker();

// let value = "Surprise!";
// function f ()
// {
//     let value = "the closest value";
//     function g ()
//     {
//         debugger; // in console: type alert( value ); Surprise!
//     }
//     return g;
// }
// let g = f();
// g();

// function sum (a)
// {
//     let num1 = a;
//     return function (b)
//     {
//         return num1 + b;
//     }
// }

// alert(sum(1)(2));

// function makeArmy ()
// {
//     let shooters = [];

//     let i = 0;
//     while (i < 10)
//     {
//         let tem = i;
//         let shooter = function ()
//         { // shooter function
//             alert(tem); // should show its number
//         };
//         shooters.push(shooter);
//         i++;
//     }

//     return shooters;
// }

// let army = makeArmy();

// army[0](); // the shooter number 0 shows 10
// army[5](); // and number 5 also outputs 10...

// function sayHi ()
// {
//     if (true)
//     {
//         var phrase = "Hello";
//     }

//     alert(phrase); // works
// }

// sayHi();
// alert(phrase); // Error: phrase is not defined

// function sayHi ()
// {
//     phrase = "Hello"; // (*)

//     if (false)
//     {
//         var phrase;
//     }

//     alert(phrase);
// }

// window.open("http://google.com");

// function sum (a)
// {
//     let cur = a;
//     function f (b)
//     {
//         cur += b;
//         return f;
//     }
//     f.toString = () =>
//     {
//         return cur + "";
//     };
//     return f;
// }

// alert(sum(1)(2)(3));

// let a = 1, b = 2;
// let sum = new Function("a", "b", "return a + b");
// alert(sum(a, b));

// function testNewFunc ()
// {
//     let a = 1, b = 2;
//     let sum = new Function("return a + b");
//     alert(sum());
// }
// testNewFunc();

// let a = 1, b = 2;
// let sum = new Function("return a + b");
// alert(sum());

// function testTimeOut (a, b)
// {
//     alert(a + b);
// }
// let count = 0;
// function testInterval ()
// {
//     if (count > 6)
//     {
//         clearInterval(timerId);
//         return;
//     }
//     alert(count++);
// }

// // setTimeout(testTimeOut, 3000, 1, 2);
// let timerId = setInterval(testInterval, 1000);

// let i = 0;

// let start = Date.now();

// function count ()
// {
//     // do a piece of the heavy job (*)
//     do
//     {
//         i++;
//     } while (i % 1e6 != 0);

//     if (i == 1e9)
//     {
//         alert("Done in " + (Date.now() - start) + 'ms');
//     } else
//     {
//         setTimeout(count); // schedule the new call (**)
//     }
// }
// count();

// function printNumbers (from, to)
// {
//     let cur = from;
//     let counter = function ()
//     {
//         console.debug(cur++);
//         if (cur > to)
//         {
//             clearInterval(timer);
//         }
//     }
//     let timer = setInterval(counter, 1000);
// }

// function printNumber (from, to)
// {
//     let cur = from;
//     setTimeout(function run ()
//     {
//         console.debug(cur++);
//         if (cur <= to)
//         {
//             setTimeout(run, 1000);
//         }

//     }, 1000);
// }

// printNumbers(6, 16);
// printNumber(1, 10);

// let i = 0;
// let start = Date.now();
// function count ()
// {
// if (i == 1000000000)
// {
//     alert("Done in " + (Date.now() - start) + 'ms');
// } else
// {
//     setTimeout(count);
// }
// // a piece of heavy job
// for (let j = 0; j < 1000000; j++)
// {
//     i++;
// }

//     let timer = setInterval(function run ()
//     {
//         for (let j = 0; j < 100; j++)
//         {
//             i++;
//         }

//         if (i == 1000)
//         {
//             alert("Done in " + (Date.now() - start) + 'ms');
//             clearInterval(timer);
//         }
//     });
// }

// count();

// function work (a, b)
// {
//     alert(a + b); // work is an arbitrary function or method
// }

// function spy (func)
// {
//     function wrapper (...args)
//     {
//         wrapper.calls.push(args);
//         return func.apply(this, args);
//     }
//     wrapper.calls = [];
//     return wrapper;
// }

// work = spy(work);

// work(1, 2); // 3
// work(4, 5); // 9

// for (let args of work.calls)
// {
//     alert('call:' + args.join()); // "call:1,2", "call:4,5"
// }

// function f (x)
// {
//     alert(x);
// }

// function delay (func, time)
// {
//     function wrapper (...args)
//     {
//         setTimeout(()=>{
//             func.apply(this,args);
//         },time);
//     }
//     return wrapper;
// }

// // create wrappers
// let f1000 = delay(f, 1000);
// let f1500 = delay(f, 5000);

// f1000("te","st"); // shows "test" after 1000ms
// f1500("test"); // shows "test" after 1500ms

// function askPassword (ok, fail)
// {
//     let password = prompt("Password?", '');
//     if (password == "rockstar") ok();
//     else fail();
// }

// let user = {
//     name: 'John',

//     loginOk ()
//     {
//         alert(`${this.name} logged in`);
//     },

//     loginFail ()
//     {
//         alert(`${this.name} failed to log in`);
//     },
// };

// user.loginOk = user.loginOk.bind(user);
// user.loginFail = user.loginFail.bind(user);
// askPassword(user.loginOk, user.loginFail);

// function askPassword (ok, fail)
// {
//     let password = prompt("Password?", '');
//     if (password == "rockstar") ok();
//     else fail();
// }

// let user = {
//     name: 'John',

//     login (result)
//     {
//         alert(this.name + (result ? ' logged in' : ' failed to log in'));
//     }
// };

// askPassword(() => { user.login(true) }, () => { user.login(true) });
// askPassword(user.login.bind(user, true), user.login.bind(user, false));

// function User (name, birth)
// {
//     this.name = name;
//     this.birth = birth;
//     Object.defineProperty(this, "age", {
//         get ()
//         {
//             let today = new Date().getFullYear();
//             return today - this.birth.getFullYear();
//         }
//     });
// }
// let michael = new User("Michael",new Date(1992,5,4));
// alert(michael.name);
// alert(michael.age);

// let head = {
//     glasses: 1
// };

// let table = {
//     __proto__: head,
//     pen: 3
// };

// let bed = {
//     __proto__: table,
//     sheet: 1,
//     pillow: 2
// };

// let pockets = {
//     __proto__: bed,
//     money: 2000
// };

// class User
// {
//     constructor(name)
//     {
//         this.name = name;
//     }
//     sayHi ()
//     {
//         alert(this.name);
//     }
// }

// // Usage:
// let user = new User("John");
// user.sayHi();

// alert("Hello World");

// class Clock
// {
//     constructor(template)
//     {
//         this.template = template;
//     }
//     start ()
//     {
//         this.render();
//         this.timer = setInterval(() => this.render(), 1000);
//     }
//     stop ()
//     {
//         clearInterval(this.timer);
//     }
//     render ()
//     {
//         this.template = "h:m:s";
//         let date = new Date();
//         let h = date.getHours();
//         if (h < 10)
//         {
//             h = '0' + h;
//         }
//         let m = date.getMinutes();
//         if (m < 10)
//         {
//             m = '0' + m;
//         }
//         let s = date.getSeconds();
//         if (s < 10)
//         {
//             s = '0' + s;
//         }
//         this.template = this.template
//             .replace('h', h)
//             .replace('m', m)
//             .replace('s', s);
//         console.log(this.template);
//     }
// }

// let clock = new Clock("h:m:s");
// clock.start();

// class Animal {

//     constructor(name) {
//       this.speed = 0;
//       this.name = name;
//     }

//     run(speed) {
//       this.speed += speed;
//       alert(`${this.name} runs with speed ${this.speed}.`);
//     }

//     stop() {
//       this.speed = 0;
//       alert(`${this.name} stopped.`);
//     }

//   }

//   class Rabbit extends Animal {
//     hide() {
//       alert(`${this.name} hides!`);
//     }

//     stop() {
//       super.stop(); // call parent stop
//       this.hide(); // and then hide
//     }
//   }

//   let rabbit = new Rabbit("White Rabbit");

//   rabbit.run(5); // White Rabbit runs with speed 5.
//   rabbit.stop(); // White Rabbit stopped. White rabbit hides!

// class Animal
// {
//     constructor(name)
//     {
//         this.name = name;
//     }
// }
// class Rabbit extends Animal
// {
//     constructor(name)
//     {
//         super(name);
//         this.name = name;
//         this.created = Date.now();
//     }
// }
// let rabbit = new Rabbit("White Rabbit"); // Error: this is not defined
// alert(rabbit.name);

// class Animal {

//   constructor(name, speed) {
//     this.speed = speed;
//     this.name = name;
//   }

//   run(speed = 0) {
//     this.speed += speed;
//     alert(`${this.name} runs with speed ${this.speed}.`);
//   }

//   static compare(animalA, animalB) {
//     return animalA.speed - animalB.speed;
//   }

// }

// // Inherit from Animal
// class Rabbit extends Animal {
//   hide() {
//     alert(`${this.name} hides!`);
//   }
// }

// let rabbits = [
//   new Rabbit("White Rabbit", 10),
//   new Rabbit("Black Rabbit", 5)
// ];

// rabbits.sort(Rabbit.compare);

// rabbits[0].run(); // Black Rabbit runs with speed 5.

// class CoffeeMachine
// {
//     _waterAmount = 0;

//     setWaterAmount (value)
//     {
//         if (value < 0) throw new Error("Negative water");
//         this._waterAmount = value;
//     }

//     getWaterAmount ()
//     {
//         return this.waterAmount;
//     }
// }

// let cm = new CoffeeMachine();
// // cm.setWaterAmount(100);
// cm._waterAmount = 66;
// alert(cm._waterAmount);

// class CoffeeMachine
// {
//     _waterAmount = 0;
//     set waterAmount (value)
//     {
//         if (value < 0) throw new Error("Negative water");
//         this._waterAmount = value;
//     }
//     get waterAmount ()
//     {
//         return this._waterAmount;
//     }
//     constructor(power)
//     {
//         this._power = power;
//     }
// }

// // create the coffee machine
// let coffeeMachine = new CoffeeMachine(100);

// // add water
// coffeeMachine.waterAmount = -10; // Error: Negative water
// alert(coffeeMachine._waterAmount);

// class CoffeeMachine
// {
//     #waterAmount = 0;

//     get waterAmount ()
//     {
//         return this.#waterAmount;
//     }

//     set waterAmount (value)
//     {
//         if (value < 0) throw new Error("Negative water");
//         this.#waterAmount = value;
//     }
// }

// let machine = new CoffeeMachine();

// machine.waterAmount = 666;
// alert(machine.#waterAmount); // Error

// let eventMixin = {
//     /**
//      * Subscribe to event, usage:
//      *  menu.on('select', function(item) { ... }
//     */
//     on (eventName, handler)
//     {
//         if (!this._eventHandlers) this._eventHandlers = {};
//         if (!this._eventHandlers[eventName])
//         {
//             this._eventHandlers[eventName] = [];
//         }
//         this._eventHandlers[eventName].push(handler);
//     },

//     /**
//      * Cancel the subscription, usage:
//      *  menu.off('select', handler)
//      */
//     off (eventName, handler)
//     {
//         let handlers = this._eventHandlers && this._eventHandlers[eventName];
//         if (!handlers) return;
//         for (let i = 0; i < handlers.length; i++)
//         {
//             if (handlers[i] === handler)
//             {
//                 handlers.splice(i--, 1);
//             }
//         }
//     },

//     /**
//      * Generate the event and attach the data to it
//      *  this.trigger('select', data1, data2);
//      */
//     trigger (eventName, ...args)
//     {
//         if (!this._eventHandlers || !this._eventHandlers[eventName])
//         {
//             return; // no handlers for that event name
//         }

//         // call the handlers
//         this._eventHandlers[eventName].forEach(handler => handler.apply(this, args));
//     }
// };

// // Make a class
// class Menu
// {
//     choose (value)
//     {
//         this.trigger("select", value);
//     }
// }
// // Add the mixin
// Object.assign(Menu.prototype, eventMixin);

// let menu = new Menu();

// // call the handler on selection:
// menu.on("select", value => alert(`Value selected: ${value}`));

// // triggers the event => shows Value selected: 123
// menu.choose("123"); // value selected

// class FormatError extends SyntaxError
// {
//     constructor(msg)
//     {
//         super(msg);
//         this.name = this.constructor.name;
//     }
// }

// let err = new FormatError("formatting error");

// alert( err.message ); // formatting error
// alert( err.name ); // FormatError
// alert( err.stack ); // stack

// alert( err instanceof FormatError ); // true
// alert( err instanceof SyntaxError ); // true (because inherits from SyntaxError)

// function loadScript (src, callback)
// {
//     let script = document.createElement('script');
//     script.src = src;
//     script.onload = () => callback(script);
//     document.head.append(script);
// }

// loadScript('https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js', script =>
// {
//     alert(`Cool, the ${script.src} is loaded`);
//     alert(_); // function declared in the loaded script
// });

// function loadScript (src)
// {
//     return new Promise(function (resolve, reject)
//     {
//         let script = document.createElement('script');
//         script.src = src;

//         script.onload = () => resolve(script);
//         script.onerror = () => reject(new Error(`Script load error for ${src}`));

//         document.head.append(script);
//     });
// }

// let promise = loadScript("https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.11/lodash.js");

// promise.then(
//     script => alert(`${script.src} is loaded!`),
//     error => alert(`Error: ${error.message}`)
// );

// promise.then(script => alert('One more handler to do something else!'));

// function delay (ms)
// {
//     return new Promise(function (resolve, reject)
//     {
//         setTimeout(resolve, ms);
//     });
// }

// // function delay (ms)
// // {
// //     return new Promise(resolve => setTimeout(resolve, ms));
// // }

// delay(3000).then(() => alert('runs after 3 seconds'));

// new Promise(function (resolve, reject)
// {

//     setTimeout(() => resolve(1), 1000);

// }).then(function (result)
// {

//     alert(result); // 1

//     return new Promise((resolve, reject) =>
//     { // (*)
//         setTimeout(() => resolve(result * 2), 1000);
//     });

// }).then(function (result)
// { // (**)

//     alert(result); // 2

//     return new Promise((resolve, reject) =>
//     {
//         setTimeout(() => resolve(result * 2), 1000);
//     });

// }).then(function (result)
// {

//     alert(result); // 4

// });

// async function showAvatar ()
// {
//     // // read our JSON
//     // let response = await fetch('/article/promise-chaining/user.json');
//     // let user = await response.json();
//     let user = {
//         'name': "qiaogaojian"
//     };
//     // read github user
//     let githubResponse = await fetch(`https://api.github.com/users/${user.name}`);
//     let githubUser = await githubResponse.json();

//     // show the avatar
//     let img = document.createElement('img');
//     img.src = githubUser.avatar_url;
//     img.className = "promise-avatar-example";
//     document.body.append(img);

//     // wait 3 seconds
//     await new Promise((resolve, reject) => setTimeout(resolve, 3000));

//     img.remove();

//     return githubUser;
// }

// showAvatar();
// alert("after await");

// async function loadJson (url)
// {
//     let response = await fetch(url);

//     if (response.status == 200) {
//         let json = await response.json();
//         return json;
//     }
//     throw new Error(response.status);
//     // await fetch(url)
//     //     .then(response =>
//     //     {
//     //         if (response.status == 200)
//     //         {
//     //             return response.json();
//     //         } else
//     //         {
//     //             throw new Error(response.status);
//     //         }
//     //     })
// }

// loadJson('https://no-such-user.json') // (3)
//     .catch(alert); // Error: 404

// <!doctype html>
// <script>
//   asyncfunction load() {
//     let say = await import('./say.js');
//     say.hi(); // Hello!
//     say.bye(); // Bye!
//     say.default(); // Module loaded (export default)!
//   }
// </script>
// <button onclick="load()">Click me</button>