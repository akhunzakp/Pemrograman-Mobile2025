import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import 'plan_screen.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // 🔹 UI Input Tambah Plan
  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Tambah Rencana Baru',
            contentPadding: EdgeInsets.all(20),
          ),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  // 🔹 Logika Tambah Plan
  void addPlan() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    final plan = Plan(name: text, tasks: const []);
    final planNotifier = PlanProvider.of(context);

    // Tambah secara immutable
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);

    textController.clear();
    FocusScope.of(context).unfocus();
  }

  // 🔹 Daftar Semua Plan
  Widget _buildMasterPlans() {
    return ValueListenableBuilder<List<Plan>>(
      valueListenable: PlanProvider.of(context),
      builder: (context, plans, child) {
        if (plans.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.note, size: 100, color: Colors.grey),
                const SizedBox(height: 10),
                Text(
                  'Anda belum memiliki rencana apapun.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            return ListTile(
              title: Text(plan.name),
              subtitle: Text(plan.completenessMessage),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PlanScreen(plan: plan),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  // 🔹 Tampilan Utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans')),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans()),
        ],
      ),
    );
  }
}
