import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).unfocus();
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  // 🔹 Tombol Tambah Task
  Widget _buildAddTaskButton(BuildContext context) {
    final planNotifier = PlanProvider.of(context);
    final planName = widget.plan.name;

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        if (planNotifier.value.isEmpty) {
          debugPrint(" Belum ada plan global!");
          return;
        }

        final planIndex =
            planNotifier.value.indexWhere((p) => p.name == planName);

        if (planIndex == -1) {
          debugPrint(" Plan tidak ditemukan di global!");
          return;
        }

        // Tambah task baru ke plan
        final updatedTasks =
            List<Task>.from(planNotifier.value[planIndex].tasks)
              ..add(const Task());

        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: planName,
            tasks: updatedTasks,
          );

        debugPrint(" Task baru berhasil ditambahkan ke $planName");
      },
    );
  }

  // 🔹 Daftar setiap task
  Widget _buildTaskTile(Task task, int index, BuildContext context, Plan plan) {
    final planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          final planIndex =
              planNotifier.value.indexWhere((p) => p.name == plan.name);

          // Validasi index
          if (planIndex == -1 ||
              index < 0 ||
              index >= plan.tasks.length) {
            debugPrint(" Indeks task tidak valid.");
            return;
          }

          final updatedTasks = List<Task>.from(plan.tasks)
            ..[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: plan.name,
              tasks: updatedTasks,
            );
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        decoration: const InputDecoration(
          hintText: 'Deskripsi tugas...',
          border: InputBorder.none,
        ),
        onChanged: (text) {
          final planIndex =
              planNotifier.value.indexWhere((p) => p.name == plan.name);

          if (planIndex == -1 ||
              index < 0 ||
              index >= plan.tasks.length) {
            debugPrint(" Indeks task tidak valid saat mengetik.");
            return;
          }

          final updatedTasks = List<Task>.from(plan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            );

          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: plan.name,
              tasks: updatedTasks,
            );
        },
      ),
    );
  }

  //  Widget Daftar Tugas
  Widget _buildList(Plan plan) {
    if (plan.tasks.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada tugas dalam Plan ini.\nTekan tombol + untuk menambahkan tugas.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) {
        if (index >= plan.tasks.length) {
          return const SizedBox.shrink();
        }
        return _buildTaskTile(plan.tasks[index], index, context, plan);
      },
    );
  }

  //  Tampilan Utama
  @override
  Widget build(BuildContext context) {
    final plansNotifier = PlanProvider.of(context);
    final planName = widget.plan.name;

    return Scaffold(
      appBar: AppBar(title: Text(planName)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          if (plans.isEmpty) {
            return const Center(child: Text("Belum ada Plan di sistem."));
          }

          final currentPlan = plans.firstWhere(
            (p) => p.name == planName,
            orElse: () => const Plan(),
          );

          if (currentPlan.name.isEmpty) {
            return const Center(
              child:
                  Text("Plan ini tidak ditemukan.\nKembali ke halaman utama."),
            );
          }

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    currentPlan.completenessMessage,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }
}
