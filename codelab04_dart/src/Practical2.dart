// Step 1
// Type or copy the following program code into the function main().

// void main() {
//   var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//   print(halogens);
// }

// Step 2:
// Please try running the code in step 1. What happens? Explain! Then, correct any errors.
// answer:
// 1. What happened? The code ran perfectly without any errors. It created a Set named halogens and printed its contents to the console.

// 2. Why? In Dart, using curly braces {} with a comma-separated list of values creates a Set. 
// A Set is a collection of unique items where the order of elements is not guaranteed. 
// Dart infers the type of the set as Set<String> because all the provided values are strings.
// No corrections are needed for this code.

// Step 3
// Add the following program code, then try executing (Run) your code.
// void main () {
//   var names1 = <String>{};
//   Set<String> names2 = {}; // This works, too.
//   var names3 = {}; // Creates a map, not a set.

//   print(names1);
//   print(names2);
//   print(names3);
// }

// Explanation:
// var names1 = <String>{}; and Set<String> names2 = {}; 
// - both correctly create empty sets because you explicitly provide the type (<String> or Set<String>).
// - var names3 = {}; is different. When Dart sees empty curly braces {} 
// without any type information, it defaults to creating a Map, not a Set. 
// While the output looks the same when empty, names3 is a Map<dynamic, dynamic>.

// Corrected and Modified Code
// void main() {
  // Variable from Step 1
//   var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//   print('Halogens Set: $halogens');

//   // Step 3 Variables
//   var names1 = <String>{};
//   Set<String> names2 = {}; // This works, too.

//   // Add elements to the first set using .add()
//   names1.add('Yuma Akhunza Kausar Putra');      // Replace with your name
//   names1.add('2341720259');  // Replace with your student ID

//   // Add elements to the second set using .addAll()
//   names2.addAll(['Yuma Akhunza Kausar Putra', '2341720259']); // Replace with your details

//   print('Names1 Set (using .add): $names1');
//   print('Names2 Set (using .addAll): $names2');
// }
// Final Report
// This lab demonstrates the creation and manipulation of the Set data type in Dart.

// A Set is an unordered collection of unique elements. It is defined using curly braces {}.

// The initial halogens set was created successfully, confirming the basic syntax.

// When declaring an empty collection, it's crucial to specify its type. Using var mySet = <String>{}; or Set<String> mySet = {}; creates a Set. Using just var myMap = {}; creates a Map by default.

// Elements can be added to a Set using two primary methods:

// .add(): Adds a single element to the set.

// .addAll(): Adds multiple elements from another collection (like a List) to the set.

// The experiment was successful and all code ran as expected after following the lab instructions.