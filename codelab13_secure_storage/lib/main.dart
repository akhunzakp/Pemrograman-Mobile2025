import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Secure Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // Controller dan variabel
  final TextEditingController pwdController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final String myKey = 'myPass';
  String myPass = '';

  // -----------------------------
  // WRITE + langsung READ ulang
  // -----------------------------
  Future<void> writeToSecureStorage() async {
    // Simpan ke storage
    await storage.write(key: myKey, value: pwdController.text);

    // Kosongkan input
    pwdController.clear();

    // Baca ulang & update UI
    final savedValue = await readFromSecureStorage();
    setState(() {
      myPass = savedValue;
    });
  }

  // -----------------------------
  // READ dari storage
  // -----------------------------
  Future<String> readFromSecureStorage() async {
    final String? value = await storage.read(key: myKey);
    return value ?? '';
  }

  @override
  void dispose() {
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secure Storage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  labelText: 'Super Secret String!',
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: writeToSecureStorage,
                child: const Text('Save Value'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  final value = await readFromSecureStorage();
                  setState(() {
                    myPass = value;
                  });
                },
                child: const Text('Read Value'),
              ),

              const SizedBox(height: 40),

              const Text(
                'Data yang Dibaca:',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              Text(
                myPass,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}