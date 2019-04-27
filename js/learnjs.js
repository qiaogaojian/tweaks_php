"use strict"
// alert("I'm JavaScript!");

// let admin;
// let name = "John";
// admin = name;
// alert(admin);

// alert(1/0);
// let age = 19;
// alert(`My age is ${age}`);

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

function makeWorker ()
{
    let name = "Pete";
    return function ()
    {
        alert(name);
    }
}
let name = "John";
let worker = makeWorker();
worker();
