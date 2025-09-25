// Step 1:
// This step covers the fundamental syntax for creating a Record.

// Code & Error Analysis
// The original code is missing a semicolon ; at the end of the print statement, which is a syntax error in Dart.


// void main () {
// var record = ('first', a: 2, b: true, 'last');
// print(record) // Error: Expected to find ';'.
// }
// Step 2: Basic Record Syntax
// Corrected Code 
// We add the required semicolon.

// void main () {
// var record = ('first', a: 2, b: true, 'last');
// print(record);
// }

// Explanation 💡
// A Record is a lightweight, immutable data structure that can hold multiple values of different types. 
// It's defined using parentheses ().
// - Fields without a name are positional.
// - Fields with a name (like a: 2) are named.

// The code creates a record with two positional fields ('first', 'last') and two named fields (a, b). 
// The output shows all the fields contained within the record.

// Step 3: Records in Functions
// This step demonstrates how to use records as function parameters and return types, and how to destructure them.

// Code & Error Analysis 
// The provided function tukar is syntactically correct, but it is never called from the main() function, so its functionality isn't demonstrated. The task is to use it.

// void main () {

// (int, int) tukar((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }
// }

// Corrected Code (in main) 
// We call the tukar function from main to show how it swaps the values in a record.


// void main () { 

// // The 'tukar' function is placed outside main()
// (int, int) tukar((int, int) record) {
//   var (a, b) = record;
//   return (b, a);
// }

//   // We call the function from within main()
//   var record = (10, 20);
//   print('Original record: $record');

//   var swappedRecord = tukar(record);
//   print('Swapped record: $swappedRecord');
// }

// Explanation 
// This example showcases two powerful features:

// 1. Records in Functions: The tukar function accepts a record (int, int) as an argument and returns a 
// new record of the same type. This is perfect for functions that need to return multiple values 
// without creating a full class.

// 2. Pattern Destructuring: The line var (a, b) = record; is a key feature. It unpacks the values 
// from the record directly into new local variables a and b. This makes the code 
// for swapping the values (return (b, a);) incredibly clean and readable.


// Step 4: Record Type Annotation
// This step explores how to declare a record variable with an explicit type and the importance of 
// initialization.

// Code & Error Analysis 
// The code declares a variable mahasiswa but doesn't initialize it with a value. Due to Dart's null 
// safety, you cannot use a non-nullable variable before it has been assigned, so print(mahasiswa) 
// causes a compile-time error.

// void main () {

// // Record type annotation in a variable declaration:
// (String, int) mahasiswa;
// print(mahasiswa); // Error: Non-nullable variable 'mahasiswa' must be assigned before it can be used.
// }

// Corrected Code
// We initialize the mahasiswa record with your name and NIM. A student ID is better represented as a 
// String, so we'll adjust the type annotation to (String, String).

// void main () {
// // Record type annotation with initialization
// (String, String) mahasiswa;
// mahasiswa = ('Yuma Akhunza Kausar Putra', '2341720259');

// print(mahasiswa);
// }

// Explanation 
// Just like any other variable in Dart, a record must be initialized before its value can be accessed. 
// This code explicitly defines the "shape" of the record as (String, String) and then assigns a matching 
// record value containing your personalized data.


// Step 5: Accessing Record Fields
// This final step shows the different ways to access the data stored inside a record.

// Code & Error Analysis 
// The original code runs without errors. The task is to modify it to include your personal data.

// void main () {

// var mahasiswa2 = ('first', a: 2, b: true, 'last');
// print(mahasiswa2.$1); // Prints 'first'
// print(mahasiswa2.a); // Prints 2
// print(mahasiswa2.b); // Prints true
// print(mahasiswa2.$2); // Prints 'last'
// } 

// Corrected Code 
// We modify the record to include your name and NIM, and then demonstrate accessing these specific fields.

// void main () {

// // Creating a record with your name (positional) and NIM (named)
// var mahasiswa2 = ('Yuma Akhunza Kausar Putra', nim: '2341720259', active: true, 'IK-1E');

// // Accessing the fields
// print('Name (positional field \$1): ${mahasiswa2.$1}');
// print('NIM (named field .nim): \${mahasiswa2.nim}');
// print('Active Status (named field .active): ${mahasiswa2.active}');
// print('Class (positional field \$2): ${mahasiswa2.$2}');

// }

// Explanation 
// There are two ways to access fields in a record:
// 1. Positional Fields: Accessed with a dollar sign and a 1-based index (e.g., mahasiswa2.$1 for the first field,
// mahasiswa2.$2 for the second).
// 2. Named Fields: Accessed by their name using dot notation (e.g., mahasiswa2.nim).

