// Step 1
// Type or copy the following program code into the function main().
// void main () {
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list1); // Error: Undefined name 'list1'.
//   print(list2);
//   print(list2.length);
// }

// Step 2
// Corrected Code 
// We correct print(list1) to print(list).
// void main () {
//   var list = [1, 2, 3];
//  var list2 = [0, ...list];
//  print(list);
//  print(list2);
//  print(list2.length);
// }

// Explanation 💡
// The spread operator (...) unpacks the elements 
// from one list and inserts them into another. In this case,
//  ...list takes all elements from list (1, 2, 3) and places
// them inside list2, resulting in [0, 1, 2, 3].

// Step 3
// This step demonstrates how to safely spread a list that might be null.

// Code & Error Analysis 🐛
// The original code again contains a typo, referring to list1 which doesn't
// exist. We will continue using the list variable from the previous step.

// void main () {
//     list1 = [1, 2, null]; // Error: Undefined name 'list1'.
//       print(list1);
//     var list3 = [0, ...?list1];
//       print(list3.length);
// }

// Corrected & Modified Code ✅
// We fix the variable name and add a new list for your NIM, combining it
// with the existing list using the spread operator.

// void main () {
//   // Continuing from the previous step
// var list = [1, 2, null];
// print("Original list with null: $list");

// var list3 = [0, ...?list]; // ...? safely spreads even if list was null
// print("List3 (spread from list): $list3");
// print("Length of List3: ${list3.length}");

// // Adding your NIM using a spread operator
// var nim = '2341720065';
// var nimList = nim.split(''); // Creates a list of characters: ['2', '3', ...]
// print("NIM as a List: $nimList");

// var combinedList = [...list3, ...nimList];
// print("Combined list with NIM: $combinedList");
// }

// Explanation 💡
// The null-aware spread operator (...?) is used when a list might be null. 
// If the list is not null (as in our case), it works just like the regular spread operator. 
// If list had been null, ...?list would have inserted nothing into list3, preventing an error.

// Step 4: Collection if
// This step shows how to conditionally include an element in a list.

// Code & Error Analysis 🐛
// The code fails because the variable promoActive is not defined.

// var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet']; // Error: Undefined name 'promoActive'.
// print(nav);

// Corrected Code & Results 
// We declare promoActive and show the output for both true and false conditions.

// void main (){

// // Case 1: promoActive is true
// bool promoActive = true;
// var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
// print("Navigation with promo active: $nav");

// // Case 2: promoActive is false
// promoActive = false;
// var nav2 = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
// print("Navigation with promo inactive: $nav2");
// }

// Step 5: Conditional Logic in Collections
// This step shows how to use conditional logic with specific values inside a list declaration.

// Code & Error Analysis 
// The provided code if (login case 'Manager') is not the correct syntax for a simple equality check inside a list. This will cause a syntax error.

// void main () {

// var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory']; // Error: Incorrect syntax.
// print(nav2);
// }

// Corrected Code & Results 
// We fix the syntax to a standard equality check (==) and declare the login variable to show different outcomes.


// void main () {
// // Case 1: User is a Manager
// String login = 'Manager';
// var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
// print("Navigation for Manager: $nav2");

// // Case 2: User is a regular user
// login = 'User';
// var nav3 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
// print("Navigation for User: $nav3");
// }

// Explanation 
// Just like in the previous step, collection if is used to add an element based on a condition.
// Here, the condition is login == 'Manager'. The 'Inventory' menu item is only added to the navigation
// list if the login variable holds the value 'Manager'.

// Step 6: Collection for
// This step demonstrates creating a new list by iterating over an existing one.

// Code & Error Analysis 
// The code provided for this step is correct and has no errors. It runs as intended.


// void main () {
//   var listOfInts = [1, 2, 3];
//   var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
//   assert(listOfStrings[1] == '#1');
//   print(listOfStrings);
// }

// Explanation 💡
// Collection for provides a concise, declarative syntax to build a collection from another. Here, 
// for (var i in listOfInts) iterates through each number in listOfInts, and for each number i, 
// it adds a new string '#$i' to listOfStrings.

// Benefits of Collection for:
// - Readability: It clearly states the intent—to create a new list based on the 
// elements of another—all in one line.

// - Conciseness: It is much shorter than creating an empty list and manually adding 
// elements in a traditional for loop.

// - Declarative Style: You declare what you want the list to contain, rather than
// listing the step-by-step procedure for building it. This often leads to code that is easier to reason about.