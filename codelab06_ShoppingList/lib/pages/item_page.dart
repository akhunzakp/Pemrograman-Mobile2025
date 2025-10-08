import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  final Item? item;
  const ItemPage({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const Scaffold(body: Center(child: Text('Item tidak ditemukan.')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item!.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), 
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(12),
        child: const Text(
          'Nama: Muhammad Farhan Fahraby '
          'NIM: 2341720188',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item!.name,
              child: Image.asset(
                item!.image!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(item!.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${item!.price}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            if (item!.stock != null) Text('Stok: ${item!.stock}'),
            if (item!.rating != null) Text('Rating: ${item!.rating}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}