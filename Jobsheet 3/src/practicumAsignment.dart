void main() {
  String name = "Ridho Anfaal";
  String nim = "2341720222";

  for (int num = 2; num <= 201; num++) {
    bool isPrime = true;

    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      print("Prime number = $num, Name: $name, NIM: $nim");
    }
  }
}
