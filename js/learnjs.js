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
let login = prompt("Who are you ?");
let message =
    (login == "Employee") ? "Hello" :
        (login == "Director") ? "Greeting" :
            (login == "") ? "No login" :
                "";
alert(message);