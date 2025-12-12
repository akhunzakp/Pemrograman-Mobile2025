// Step 1: Deklarasi Konstanta untuk Kunci JSON
const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  // Step 2: Konstruktor fromJson() menggunakan Konstanta dan Robustness
  Pizza.fromJson(Map<String, dynamic> json) :
      // ID: tryParse & ?? 0
      id = int.tryParse(json[keyId].toString()) ?? 0,
      
      // pizzaName: Ternary Operator untuk 'No name'
      pizzaName = json[keyName] != null 
          ? json[keyName].toString() 
          : 'No name',
      
      // description: Ternary Operator untuk '' (string kosong)
      description = json[keyDescription] != null
          ? json[keyDescription].toString()
          : '',
      
      // price: double.tryParse & ?? 0.0
      price = double.tryParse(json[keyPrice].toString()) ?? 0.0,
      
      // imageUrl: Null Coalescing sederhana
      imageUrl = (json[keyImage] ?? '').toString();

  // Step 3: Metode toJson() menggunakan Konstanta
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}