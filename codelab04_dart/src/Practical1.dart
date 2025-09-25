// Step 1
// Type or copy the following program code into void main().
// void main() {
//   var list = [1, 2, 3];
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 1;
//   assert(list[1] == 1);
//   print(list[1]);
// }
// Step 2:
// Please try executing the code in step 1. What happens? Explain!
// Answer : This code creates a list with a length of 6, where all elements are null. Even though this list is declared as final, its contents can still be changed.
// This code creates a list with a length of 6, where all elements are null. Even though this list is declared as final, its contents can still be changed.

// - final means the list variable cannot be reassigned to a completely new list.
// - However, the elements inside that list (like list[1], list[2], etc.) are still mutable and can be changed.
// This is why we were able to successfully add the name and NIM into the final list without any errors.

// Step 3:
// Change the code in step 1 to become a final variable that has index = 5 with default value = null. Fill in your name and NIM in the 1st and 2nd index elements. Then print and capture the results.

// void main() {
//   final list = List.filled(5, null); // List dengan 5 elemen null

//   // Isi data
//   list[0] = "Yuma Akhunza Kausar Putra";  // ganti dengan nama kamu
//   list[1] = "2341720259";          // ganti dengan NIM kamu

//   // Cetak hasil
//   print(list);
// }

// The code above doesn't work.
// This means that when you create a list with List.
// filled(5, null), Dart assumes the list is of type List<Null>, 
// so it can only hold nulls. When you fill it with "Putra" or "2341720065," 
// it immediately throws an error because Strings don't match Null.

// Fix code:
// void main() {
//   final List<String?> list = List.filled(5, null); // List dengan 5 elemen null

//   // Isi data
//   list[0] = "Yuma Akhunza Kausar Putra";  // Nama
//   list[1] = "2341720259";          // NIM

//   // Cetak hasil
//   print(list);
// }

// You must define a list data type to accommodate strings.
// Use List<String?> (a nullable string, meaning it can be either a string or null).



