// Step 1 
// Type or copy the following program code into the function main().
// void main() {
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 1
//   };

//   var nobleGases = {
//     2: 'helium',
//     10: 'neon',
//     18: 2,
//   };

//   print(gifts);
//   print(nobleGases);
// }

// Explanation:

// The code successfully creates two Map objects. 
// A Map is a collection of key-value pairs, where each key must be unique.

// However, there's a logical issue: the data types of the values are inconsistent.
// - In gifts, the values are mostly Strings, but the last one is an int (1). 
// Dart infers the type as Map<String, Object>.
// - In nobleGases, the values are also mixed (String and int).
// Dart infers this type as Map<int, Object>.
// For data consistency, it's better if all values in a map share the same type

// Corrected Code
// To fix the inconsistent data, we'll ensure all values are Strings. 
// The value 1 in gifts seems like a placeholder for 'golden rings', and the 2 
// in nobleGases is likely a typo for 'argon' (atomic number 18).

// Corrected for consistent data types
// void main() {
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 'golden rings' // Corrected to String
//   };

//     var nobleGases = {
//       2: 'helium',
//       10: 'neon',
//       18: 'argon', // Corrected to String
//   };
//   print(gifts);
//  print(nobleGases);
// }

// Step 3
// This step involves creating new, empty maps and then populating all four maps
// with additional information. The initial code provided in the lab has
// a logical error: it declares new maps (mhs1, mhs2) but then modifies the
// old maps (gifts, nobleGases).

// The corrected code below declares all four maps correctly and
// adds the student details to each one as required.

// Final Combined & Corrected Code
// void main() {
//   // 1. Map yang sudah dikoreksi dari Langkah 1
//   var gifts = <String, String>{
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 'golden rings'
//   };

//   var nobleGases = <int, String>{
//     2: 'helium',
//     10: 'neon',
//     18: 'argon',
//   };

//   // 2. Map baru dari Langkah 3
//   var mhs1 = Map<String, String>();
//   var mhs2 = Map<int, String>();

//   // 3. Menambahkan detail nama dan NIM Anda ke semua map
  
//   // Menambahkan ke gifts (key bertipe String)
//   gifts['nama'] = 'Yuma Akhunza Kausar Putra';
//   gifts['nim'] = '2341720259';

//   // Menambahkan ke nobleGases (key bertipe int)
//   nobleGases[100] = 'Joko Priyambodo';
//   nobleGases[101] = '2341720098';

//   // Menambahkan ke mhs1 (key bertipe String)
//   mhs1['name'] = 'Yuma Akhunza Kausar Putra';
//   mhs1['student_id'] = '2341720065';

//   // Menambahkan ke mhs2 (key bertipe int)
//   mhs2[1] = 'Joko Priyambodo';
//   mhs2[2] = '2341720098';
  
//   // 4. Mencetak semua hasil
//   print("Gifts Map: $gifts");
//   print("Noble Gases Map: $nobleGases");
//   print("MHS1 Map: $mhs1");
//   print("MHS2 Map: $mhs2");
// }