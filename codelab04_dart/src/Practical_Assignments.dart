// ## Practical Assignments

// 1.Please complete Practicals 1 to 5, then document your work with screenshots and explanations!

// 2.Explain what is meant by Functions in Dart language!

// 3.Explain the types of parameters in Functions along with examples of their syntax!

// 4.Explain the meaning of Functions as first-class objects along with examples of their syntax!

// 5.What are Anonymous Functions? Explain and give an example!

// 6.Explain the difference between lexical scope and lexical closures! Give an example!

// 7.Explain with an example how to make multiple value returns in Functions!

// Submit the GitHub repo commit link to the lecturer as agreed in class!

// ANSWER
// 1. I have made the document

// 2. In Dart, a Function is a reusable block of code that performs a specific task. Think of it like a coffee machine : you put in inputs (coffee beans, water), it performs a series of actions (grinds, heats, brews), and it gives you an output (a cup of coffee).

// Key characteristics of a function:
// 1. It has a name (so you can call it).
// 2. It can accept parameters (inputs).
// 3. It contains a body of code (the set of instructions).
// 4. It can return a value (the output or result).

// // A simple function that takes a name and returns a greeting.
// String sayHello(String name) {
//   return 'Hello, $name!';
// }

// void main() {
//   // Calling the function
//   print(sayHello('Putra')); // Output: Hello, Putra!
// }

// 3. Types of Parameters in Functions
// Dart functions have flexible parameter options:

// a. Positional Parameters
// These are the standard, required parameters. The order in which you pass the arguments matters.

// - Syntax: returnType functionName(type param1, type param2)

// Example:

// void main () {
// void printIdentity(String name, String nim) {
//   print('Name: $name, NIM: $nim');
// }

// // Must be called with arguments in the correct order.
// printIdentity('Yuma Akhunza Kausar Putra', '2341720259'); 
// }

// b. Named Parameters
// These are optional by default and are wrapped in curly braces {}. Their position doesn't 
// matter when calling the function, making the code more readable. You can make them mandatory 
// by using the required keyword.

// - Syntax: returnType functionName({type? param1, type? param2, required type param3})

// Example:

// void main () {

// void printCourse({String? courseName, int? credits, required String instructor}) {
//   print('Course: $courseName, Credits: $credits, Instructor: $instructor');
// }

// // Called by name, order doesn't matter.
// printCourse(instructor: 'Dr. Smith', courseName: 'Mobile Programming');
// }

// c. Optional Positional Parameters
// These are positional parameters that you can omit when calling the function. 
// They are wrapped in square brackets [].

// -Syntax: returnType functionName(type requiredParam, [type? optionalParam])

// Example:
// void main () {

// void printItem(String itemName, [String? size = 'Medium']) {
//   print('$itemName ($size)');
// }

// printItem('T-Shirt'); // Output: T-Shirt (Medium)
// printItem('Jacket', 'Large'); // Output: Jacket (Large)
// }

// 4. Functions as First-Class Objects
// Saying functions are "first-class objects" or "first-class citizens" means they are treated 
// like any other variable (like an int or a String). This powerful concept means you can:

// 1. Assign a function to a variable.
// 2. Pass a function as an argument to another function.
// 3. Return a function from another function.

// Example:

// void main() {
// // A simple function to say "Loudly"
// String scream(String message) {
//   return '${message.toUpperCase()}!!!';
// }


//   // 1. Assign a function to a variable
//   var myFunc = scream;
//   print(myFunc('Hello')); // Output: HELLO!!!

//   // 2. Pass a function as an argument
//   List<String> words = ['a', 'b', 'c'];
//   words.forEach(scream); // This won't print, forEach expects void. A better example:
//   var loudWords = words.map(scream).toList();
//   print(loudWords); // Output: [A!!!, B!!!, C!!!]

//   // 3. Return a function from another function
//   Function multiplier(int factor) {
//     return (int number) => number * factor;
//   }
//   var twice = multiplier(2); // 'twice' is now a function
//   print(twice(5)); // Output: 10
// }

// 5. Anonymous Functions
// An Anonymous Function is a function without a name. It's also known as a lambda or a closure. 
// They are useful for short, one-time-use functions, especially when passed as arguments to other functions.

// The syntax is concise, especially with the arrow => notation for single-expression functions.

// - Syntax: (parameters) { statements; } or (parameter) => expression

// Example:

// void main() {
//   var fruits = ['apple', 'banana', 'orange'];

//   // Using an anonymous function with forEach
//   fruits.forEach((fruit) {
//     print('I love to eat $fruit.');
//   });

//   // Using arrow syntax with map
//   var loudFruits = fruits.map((fruit) => fruit.toUpperCase()).toList();
//   print(loudFruits); // Output: [APPLE, BANANA, ORANGE]
// }

// 6. Lexical Scope vs. Lexical Closures
// a. Lexical Scope
// Lexical scope means that the scope (or visibility) of variables is determined by 
// where they are physically located in the source code. A function can access variables 
// in its own scope and also in any parent scopes.

// Example:

// Dart
// void main () {
// String topLevelVar = "I'm at the top!";

// void myFunction() {
//   String innerVar = "I'm inside myFunction!";

//   void nestedFunction() {
//     // This function can access its own variables,
//     // its parent's variables (innerVar),
//     // and the top-level variables.
//     print(innerVar); 
//     print(topLevelVar);
//   }
//   nestedFunction();
// }
// // nestedFunction(); // Error: Not visible here.
// myFunction(); // This will print both variables.
// }

// b. Lexical Closure
// A lexical closure is a function object that "remembers" its lexical scope, even when the 
// function is executed outside of that original scope. The function "closes over" the variables 
// it needs from its environment. Think of the function carrying a "backpack" 🎒 with all the 
// variables it needs.

// Example:

// Dart

// Function makeGreeter(String greeting) {
//   // This is the parent scope. The returned function will remember 'greeting'.
//   return (String name) {
//     // This is the closure. It uses 'greeting' from its parent.
//     return '$greeting, $name!';
//   };
// }

// void main() {
//   // Create a greeter. The returned function "remembers" that greeting = 'Hello'
//   var helloGreeter = makeGreeter('Hello');

//   // Create another greeter. It "remembers" greeting = 'Good morning'
//   var morningGreeter = makeGreeter('Good morning');

//   // Now we call the closures, long after makeGreeter() has finished.
//   print(helloGreeter('Putra'));    // Output: Hello, Putra!
//   print(morningGreeter('Putra')); // Output: Good morning, Putra!
// }
// The key difference is that lexical scope is a static rule about where variables can be seen, while 
// a closure is a dynamic object that captures that scope and carries it around.

// 7. Returning Multiple Values from Functions
// Before Dart 3.0, returning multiple values from a function was clumsy—you had to use a List, 
// Map, or create a whole class. Now, the best and simplest way is to use a Record.

// A Record is a lightweight, anonymous type that can bundle multiple objects into a single value.

// - Example:

// Dart

// This function returns a Record containing a String and an int.
// (String, int) getMahasiswa() {
//   String name = 'Yuma Akhunza Kausar Putra';
//   int entryYear = 2023;
//   return (name, entryYear);
// }

// void main() {
//   // Call the function and destructure the record into variables.
//   var (name, year) = getMahasiswa();

//   print('Name: $name');
//   print('Entry Year: $year');
// }

// This method is type-safe, readable, and requires no boilerplate code, making it the modern standard in Dart.


