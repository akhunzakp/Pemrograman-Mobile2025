# Codelab10
## Practical 1: Basic State with Model-View

### Step 1: Create a New Project
Create a new Flutter project named master_plan in the src folder of week 10 of your GitHub repository, or according to the agreed-upon lab report style. Then, create a folder structure within the project as shown in the image below.


### Step 2: Creating a modeltask.dart
```dart:
// lib/models/task.dart

class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```


### Step 3: Create a fileplan.dart
```dart:
// lib/models/plan.dart

import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}
```



### Step 4: Create a filedata_layer.dart
```dart:
// lib/models/data_layer.dart

export 'plan.dart';
export 'task.dart';
```


### Step 5: Move to filemain.dart
```dart:
// lib/main.dart

import 'package:flutter/material.dart';
import './views/plan_screen.dart'; // Import tampilan yang akan dibuat

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
        primarySwatch: Colors.purple, // Mengatur warna utama aplikasi
        useMaterial3: true,
     ),
     home: const PlanScreen(), // Menampilkan PlanScreen
    );
  }
}
```


### Step 6: createplan_screen.dart
```dart:
// lib/views/plan_screen.dart

import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // ⬇️ State lokal yang dikelola oleh StatefulWidget
  Plan plan = const Plan();

  // Method dummy (akan diisi di langkah berikutnya)
  Widget _buildList() => const SizedBox.shrink(); 
  Widget _buildAddTaskButton() => const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // Ganti ‘Namaku' dengan Nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plan [Ganti dengan Nama Panggilan Anda]')),
    body: _buildList(),
    floatingActionButton: _buildAddTaskButton(),
   );
  }
}
```


### Step 7: create a method_buildAddTaskButton()
```dart:
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          // Membuat Plan baru (immutable) dengan Task baru ditambahkan
          plan = Plan(
            name: plan.name,
            tasks: List<Task>.from(plan.tasks)
              ..add(const Task()),
          );
        });
      },
    );
  }
```


### Step 8: create a widget_buildList()
```dart:
  // ⬇️ Method untuk membangun daftar tugas (ListView)
  Widget _buildList() {
    return ListView.builder(
      // Tambahkan controller dan keyboard behavior
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index),
    );
  }
```


### Step 9: create a widget_buildTaskTile
```dart:
  // Method untuk membangun Tile (item) tugas
  Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      // Checkbox untuk status Selesai/Belum
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              // Memutakhirkan status 'complete' pada Task di index tersebut
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      // Text Field untuk mengedit deskripsi
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            // Memutakhirkan 'description' pada Task di index tersebut
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```


### Step 10: Add Scroll Controller


### Step 11: Add Scroll Listener
```dart:
  // Method build utama
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ganti ‘Namaku' dengan Nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plan [Nama Panggilan Anda]')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }
```


### Step 12: Add controller and keyboard behavior
```dart:
  // ⬇️ Method untuk membangun daftar tugas (ListView)
  Widget _buildList() {
    return ListView.builder(
      // Tambahkan controller dan keyboard behavior
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
      
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index),
    );
  }
```

### Step 13: Finally, add the dispose() method.



## Practical Assignment 1: Basic State with Model-View
1. Complete the lab steps, then document the final results with a GIF and explanation in the file README.md! If you find any errors or issues, please fix them.
- i have done yet

2. Explain the purpose of step 4 in the practicum! Why is this done?
- Step 4 prompts the creation of a lib/models/data_layer.dart file containing: 
```dart:
export 'plan.dart';
export 'task.dart';
```
Aims and Objectives:
The main purpose of this step is to simplify import management across the application. This is known as the Barrel Export pattern or Exporting Facade.

Import Simplification: Instead of importing each data model (task.dart, plan.dart, etc.) individually in each file that requires it, we only need to import one main file:

Code Cleanliness: It reduces long and dense import lines of code inside view files (such as plan_screen.dart), making the code cleaner and more readable, especially as the number of data models increases.

3. Why is the plan variable needed in step 6 of the lab? Why is it a constant?
- A. Why is the plan variable necessary?
The plan variable serves as the local state and single source of truth for all data displayed on the PlanScreen.

It stores the list of tasks and their names from the main plan.

Each view widget (ListView.builder, _buildTaskTile) accesses the data through this plan variable.

B. Why create a constant (const)?
The plan variable itself is declared to be mutable (Plan plan = ...). However, its initial value and all state updates in Steps 7 and 9 are based on the principle of Immutable Data.

Immutable Data: The Task and Plan model classes are defined as final and const (unchangeable after creation).

Proper State Change Mechanism: In Flutter, to update an immutable object that represents state, you must create a new object to replace the old one. Each update (setState) replaces the old plan with a new Plan object containing the changed data, like this:

4. Capture the results of Step 9 as a GIF, then explain what you have created!
- ![alt text](<images/lab1/Adobe Express - WhatsApp Video 2025-11-02 at 21.28.13_4afce270.gif>)

- Interaction: Both widgets (Checkbox and TextFormField) use their onChanged callbacks to trigger data changes.

- State Management: Inside each onChanged call, you call setState(() { ... }).

- Immutable Data Updates: Inside setState, you perform the following steps:
    1. Create a copy of the plan.tasks list.
    2. Create a new Task object with updated properties (e.g., complete: selected ?? false or description: text).
    3. Replace the old Task object at the relevant index with the new Task object.
    4. Replace all plan variables with the new Plan object.

5. What is the use of the methods in Steps 11 and 13 in the lifecycle state ?
- Use of initState() (Step 11)

initState() is the first method called only once when the State object is created and inserted into the widget tree. This is a good time to perform a one-time initialization.

    1. General Purpose: To initialize necessary data for the widget or set up a subscription to an external service.

    2. Practical Purpose: Here, initState() is used to initialize the ScrollController. You add a listener to the controller. This listener removes focus from any TextFormField when the user begins scrolling. This is crucial for improving the user experience, especially on iOS devices, where the keyboard can obstruct the bottom-most input.

- Use of dispose() (Step 13)

Dispose() is the last method called before the State object is permanently removed from the widget tree (for example, when the widget moves to another screen or is destroyed).

    1. General Purpose: To clean up and release all resources allocated in initState() or during the widget's lifecycle.

    2. Practical Purpose: Here, dispose() is used to call scrollController.dispose(). Explicitly releasing controllers and listeners is mandatory in Flutter. Failure to do so will result in listeners remaining active in memory even after the widget is no longer present, which can lead to memory leaks and potential app crashes.

6. Submit your practicum report in the form of a commit link or GitHub repository to the agreed lecturer!

## Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier

### Step 1: Create a fileplan_provider.dart
```dart:
// lib/provider/plan_provider.dart

import 'package:flutter/material.dart';
import '../models/data_layer.dart';

// InheritedNotifier memungkinkan kita untuk memberi tahu widget yang
// bergantung (depend) padanya ketika 'notifier' berubah.
class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  
  const PlanProvider({
    super.key, 
    required Widget child, 
    required ValueNotifier<Plan> notifier
  }) : super(child: child, notifier: notifier);

  // Method statis untuk mendapatkan ValueNotifier<Plan> dari konteks.
  static ValueNotifier<Plan> of(BuildContext context) {
   // dependOnInheritedWidgetOfExactType akan memastikan widget ini me-rebuild 
   // saat ValueNotifier berubah.
   return context
    .dependOnInheritedWidgetOfExactType<PlanProvider>()!
    .notifier!;
  }
}
```


### Step 2: Editmain.dart
```dart:
// lib/main.dart
// (Pastikan Anda telah mengimpor PlanProvider di sini jika belum)

import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './provider/plan_provider.dart'; // Import PlanProvider

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
        primarySwatch: Colors.purple, 
        useMaterial3: true,
     ),
     // ⬇️ Ganti home dengan PlanProvider
     home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()), // State Plan diinisialisasi
        child: const PlanScreen(),
     ),
    );
  }
}
```


### Step 3: Add methods to the modelplan.dart
```dart:
// lib/models/plan.dart

import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
  
  // ⬇️ Tambahkan dua methods (getters) ini:
  int get completedCount => tasks
    .where((task) => task.complete)
    .length;

  String get completenessMessage =>
    '$completedCount out of ${tasks.length} tasks';
}
```


### Step 4: Move to PlanScreen


### Step 5: Edit method_buildAddTaskButton


### Step 6: Edit method_buildTaskTile
```dart:
// lib/views/plan_screen.dart (di dalam class _PlanScreenState)

// ⬇️ Tambahkan BuildContext sebagai parameter
Widget _buildTaskTile(Task task, int index, BuildContext context) {
  // Dapatkan Notifier
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);

  return ListTile(
    leading: Checkbox(
       value: task.complete,
       onChanged: (selected) {
         Plan currentPlan = planNotifier.value;
         planNotifier.value = Plan(
           name: currentPlan.name,
           tasks: List<Task>.from(currentPlan.tasks)
             ..[index] = Task(
               description: task.description,
               complete: selected ?? false,
             ),
         );
       }),
    // ⬇️ Menggunakan TextFormField (sudah benar, tidak perlu diubah dari langkah 9 sebelumnya)
    title: TextFormField( 
      initialValue: task.description,
      onChanged: (text) {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            ),
        );
      },
    ),
  );
}
```

### Step 7: Edit_buildList
```dart:
// lib/views/plan_screen.dart (di dalam class _PlanScreenState)

// ⬇️ Sekarang menerima objek Plan sebagai parameter
Widget _buildList(Plan plan) { 
   return ListView.builder(
     controller: scrollController,
     keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
     
     itemCount: plan.tasks.length,
     // ⬇️ Sesuaikan parameter pemanggilan _buildTaskTile
     itemBuilder: (context, index) =>
        _buildTaskTile(plan.tasks[index], index, context), 
   );
}
```

### Step 8: Stay inclass PlanScreen & Step 9: Add widgetsSafeArea
```dart:
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan')),
      
      // ValueListenableBuilder adalah kunci: hanya bagian ini yang me-rebuild saat Plan berubah
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context), // Mengambil Notifier dari Provider
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)), // Daftar tugas di Expanded
              // Menampilkan pesan progres (menggunakan getter completenessMessage dari Plan)
              SafeArea(child: Text(plan.completenessMessage)) 
            ],
          );
        },
      ),
      
      // Mengirim context ke FloatingActionButton
      floatingActionButton: _buildAddTaskButton(context),
    );
  }
```


## Practical Assignment 2: InheritedWidget
1. Complete the lab steps, then document the final results with a GIF and explanation in the file README.md! If you find any errors or issues, please correct them according to the application's purpose.
- i have done yet

2. Explain what is meant InheritedWidgetby step 1! Why is it used InheritedNotifier?
- A. What is an InheritedWidget?
An InheritedWidget is a special type of widget in Flutter that allows the data it stores to be propagated to all widgets below it in the widget tree efficiently.

Primary Purpose: Acts as a data gateway that can be accessed from anywhere below it using BuildContext (via methods like context.dependOnInheritedWidgetOfExactType).

Advantages: Prevents prop drilling (manually passing data through each widget's constructor).

- B. Why use InheritedNotifier?
InheritedNotifier is a more advanced version of InheritedWidget.

InheritedWidget (Basic): Only notifies child widgets to rebuild when the widget itself is rebuilt. It doesn't know when its internal data changes.

InheritedNotifier: Built on top of InheritedWidget and requires a Notifier object (in this case, ValueNotifier<Plan>).

When the value inside ValueNotifier changes (for example, planNotifier.value = NewPlan), InheritedNotifier will automatically notify all child widgets that depend on it (dependOnInheritedWidgetOfExactType) to rebuild.

This makes state management reactive and very efficient, as it eliminates the need for setState calls at the view level.


3. Explain the purpose of the method in step 3 of the practicum! Why is this done?

- 
```dart:
// lib/models/plan.dart

int get completedCount => tasks
  .where((task) => task.complete)
  .length;

String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```
Purpose and Reasoning:
The primary purpose of adding these methods is to implement the "Model is Fully Responsible" principle.

    - Logic in the Model: These two methods function as business logic within the Model (Plan). They are responsible for processing or calculating existing data.

    - Separation of Duties: The logic for determining "how many tasks have been completed" is a detail of the Plan data itself, not a task of the View. By placing it in the Plan, you ensure:

        1. Reusability: The progress calculation logic can be used anywhere without rewriting.

        2. Readability: The view code (PlanScreen) remains clean and focuses solely on rendering the UI. The View only needs to call plan.completenessMessage without knowing the details of the calculation.

It is a best practice for the Model to store not only the data but also the logic closely related to that data.

4. Capture the results of Step 9 as a GIF, then explain what you have created!


Step 9 is a critical point because it combines the global data model with a reactive view:

    1. ValueListenableBuilder: This is a widget that explicitly "listens" for changes to the ValueNotifier<Plan> provided by PlanProvider.of(context).

    2. Efficient Updates: When planNotifier.value is updated (for example, when you click a checkbox), only the builder inside ValueListenableBuilder is called for the rebuild. This avoids unnecessary rebuilds on other widgets, resulting in excellent performance.

    3. Task Progress: You add a progress message (plan.completenessMessage) to the footer of the widget tree (SafeArea(child: Text(...))). When a checkbox is clicked, this message updates in real-time because it reads from the new plan object.

5. Submit your practicum report in the form of a commit link or GitHub repository to the agreed lecturer!


## Practical 3: Creating State on Multiple Screens

### Step 1: EditPlanProvider
```dart:
// lib/provider/plan_provider.dart

import 'package:flutter/material.dart';
import '../models/data_layer.dart';

//  Ubah dari Plan menjadi List<Plan>
class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  
  const PlanProvider({
    super.key, 
    required Widget child, 
    //  Ubah dari Plan menjadi List<Plan>
    required ValueNotifier<List<Plan>> notifier
  }) : super(child: child, notifier: notifier);

  //  Ubah dari Plan menjadi List<Plan>
  static ValueNotifier<List<Plan>> of(BuildContext context) {
   return context
    .dependOnInheritedWidgetOfExactType<PlanProvider>()!
    .notifier!;
  }
}
```

### Step 2: Editmain.dart
```dart:
// lib/main.dart

import 'package:flutter/material.dart';
import './views/plan_creator_screen.dart'; // ⬇️ Ganti PlanScreen ke PlanCreatorScreen
import './provider/plan_provider.dart'; 
import './models/data_layer.dart'; 

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  Pembungkus PlanProvider sekarang menggunakan List<Plan>
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []), // Inisialisasi dengan List kosong
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          useMaterial3: true,
        ),
        //  Ganti home ke PlanCreatorScreen
        home: const PlanCreatorScreen(), 
      ),
    );
  }
}
```

### Step 3: Edit plan_screen.dart
```dart:
class PlanScreen extends StatefulWidget {
  final Plan plan; 
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}
```

### Step 4: Error
Error:

After you changed the PlanProvider from holding a single Plan to holding a List<Plan> (Steps 1 & 2), all legacy calls to PlanScreen like this:
```dart:
// Kode lama di PlanScreen (Lab 2)
ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
```
Error Reason:

  1. Data Type Changed: Previously, PlanProvider.of(context) returned ValueNotifier<**Plan**>.

  2. New Data Type: Now, PlanProvider.of(context) returns ValueNotifier<**List<Plan>**>.

  3. Type Mismatch: The compiler does not allow you to assign a List<Plan> data type to a variable declared to hold only one Plan.

### Step 5: Addgetter Plan
```dart:
class _PlanScreenState extends State<PlanScreen> {
  // Variabel 'plan' lokal (Plan plan = const Plan();) telah DIHAPUS.
  // Data Plan sekarang diakses dari PlanProvider.

  late ScrollController scrollController;
  //  LANGKAH 5: Getter 'plan'
  // Ini adalah pengganti variabel 'plan' lokal yang dihapus di Lab 2.
  // Getter ini mengambil objek Plan yang diterima PlanScreen dari layar sebelumnya.
  Plan get plan => widget.plan;
  ```

### Step 6: MethodinitState()
```dart:
class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan; 

  // ⬇️ LANGKAH 6: Method initState() (Tetap Sama)
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        // Logika untuk menghilangkan fokus keyboard saat scroll
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  // Method dispose() (Tetap Sama)
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
```

### Step 7: Widgetsbuild
```dart:
@override
Widget build(BuildContext context) {
  // ⬇️ 1. Ambil ValueNotifier yang kini berisi List<Plan>
  ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

  return Scaffold(
    // AppBar menggunakan nama Plan yang spesifik untuk layar ini (dari Langkah 5)
    appBar: AppBar(title: Text(plan.name)),
    
    // ⬇️ 2. ValueListenableBuilder mendengarkan List<Plan>
    body: ValueListenableBuilder<List<Plan>>(
      valueListenable: plansNotifier,
      builder: (context, plans, child) {
        
        // ⬇️ 3. Logika Kunci: Cari Plan yang spesifik (currentPlan) dari List global
        // Jika PlanScreen ini menampilkan "Learn Flutter", ia mencari Plan dengan nama itu.
        Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
        
        return Column(
          children: [
            // ⬇️ Membangun daftar tasks dari currentPlan yang spesifik
            Expanded(child: _buildList(currentPlan)), 
            // ⬇️ Menampilkan pesan progres dari currentPlan
            SafeArea(child: Text(currentPlan.completenessMessage)),
          ],
        );
      },
    ),
    // FloatingActionButton juga harus diperbarui untuk menerima BuildContext
    floatingActionButton: _buildAddTaskButton(context), 
  );
}
```

### Step 8: Edit_buildTaskTile
```dart:
Widget _buildAddTaskButton(BuildContext context) {
  // Ambil ValueNotifier yang berisi List<Plan>
  ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
  
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Plan currentPlan = plan; // Mengambil Plan yang sedang dilihat (dari getter)
      
      // ⬇️ 1. Cari indeks Plan ini dalam daftar global
      int planIndex = planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
      
      // 2. Buat Task baru dan daftar Task yang diperbarui
      List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
        ..add(const Task());
        
      // 3. Perbarui daftar Plan global (Provider)
      // Menyalin List<Plan> global, lalu mengganti Plan di indeks yang ditemukan
      planNotifier.value = List<Plan>.from(planNotifier.value)
        ..[planIndex] = Plan(
          name: currentPlan.name,
          tasks: updatedTasks, // menggunakan daftar tasks yang baru
        );
        
      // Catatan: Pembaruan di atas sudah cukup karena ValueListenableBuilder akan me-rebuild.
    },
  );
```

### Step 9: Create a new screen
```dart:
// lib/views/plan_creator_screen.dart

import 'package:flutter/material.dart';
// Impor model dan provider yang dibutuhkan
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import 'plan_screen.dart'; // Import PlanScreen untuk navigasi

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  // Variabel dan method akan ditambahkan di langkah berikutnya (10-14)
  
  // Ini adalah kode dari Langkah 10 (TextEditingController)
  final textController = TextEditingController();

  // Ini adalah kode dari Langkah 11 (build method) - HANYA KERANGKA
  @override
  Widget build(BuildContext context) {
    // Implementasi lengkap build method ada di Langkah 11
    return const Scaffold(
      appBar: AppBar(title: Text('Master Plans')),
      body: Center(child: Text('Layar Pembuat Rencana')),
    );
  }
  
  // Ini adalah kode dari Langkah 10 (dispose)
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Method addPlan(), _buildListCreator(), dan _buildMasterPlans() 
  // akan ditambahkan di Langkah 12-14.
}
```

### Step 10: Move to the _PlanCreatorScreenState class
```dart:
// lib/views/plan_creator_screen.dart

import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../provider/plan_provider.dart';
import 'plan_screen.dart'; // Import PlanScreen untuk navigasi

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  
  //  LANGKAH 10: Deklarasi TextEditingController
  final textController = TextEditingController(); 

  // Method build akan diisi di Langkah 11
  @override
  Widget build(BuildContext context) {
    // Placeholder (akan diisi di Langkah 11)
    return const Scaffold(
      appBar: AppBar(title: Text('Master Plans')),
      body: Center(child: Text('Layar Pembuat Rencana')),
    );
  }

  //  LANGKAH 10: Method dispose() untuk membersihkan sumber daya
  @override
  void dispose() {
    textController.dispose(); // Wajib: Membersihkan controller saat widget dihapus
    super.dispose();
  }
  
  // Method-method lain (addPlan, _buildListCreator, _buildMasterPlans) 
  // akan ditambahkan di langkah-langkah berikutnya (12, 13, 14).
}
```

### Step 11: Move to the build method
```dart:
  // Method build akan diisi di Langkah 11
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Ganti ‘Namaku' dengan nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plans [Ganti Nama Panggilan]')),

      // Body disusun dalam kolom vertikal
      body: Column(
        children: [
          _buildListCreator(), //  Akan diisi di Langkah 12 (Input teks)
          Expanded(
            child: _buildMasterPlans(),
          ), //  Akan diisi di Langkah 14 (Daftar Plans)
        ],
      ),
    );
  }
```

### Step 12: Create a widget_buildListCreator
```dart:
  //  DARI LANGKAH 12: Widget untuk membuat Plan baru
  Widget _buildListCreator() {
    return Padding(
       padding: const EdgeInsets.all(20.0),
       child: Material(
         color: Theme.of(context).cardColor,
         elevation: 10,
         child: TextField(
            controller: textController,
            decoration: const InputDecoration(
               labelText: 'Add a plan',
               contentPadding: EdgeInsets.all(20)),
            // Memanggil addPlan (akan diisi di Langkah 13) saat selesai mengetik
            onEditingComplete: addPlan), 
       ));
  }
```

### Step 13: Createvoid addPlan()
```dart:
 //  Placeholder untuk Langkah 13
  void addPlan() {
    final text = textController.text;

    // 1. Cek apakah input kosong
    if (text.isEmpty) {
      return;
    }

    // 2. Buat objek Plan baru
    final plan = Plan(name: text, tasks: const []);

    // 3. Akses Provider global (ValueNotifier<List<Plan>>)
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    // 4. Perbarui daftar Plan global (Menambahkan Plan baru)
    // Menyalin List lama, lalu menambahkan Plan baru
    planNotifier.value = List<Plan>.from(planNotifier.value)..add(plan);

    // 5. Bersihkan Input dan Hilangkan Fokus
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());

    // 6. Memicu Rebuild (secara eksplisit, walaupun ValueListenableBuilder mungkin sudah mengurusnya)
    setState(() {});
  }
```

### Step 14: Createwidget _buildMasterPlans()
```dart:
  //  Placeholder untuk Langkah 14
  Widget _buildMasterPlans() {
    //  1. ValueListenableBuilder mendengarkan List<Plan> global
    return ValueListenableBuilder<List<Plan>>(
      valueListenable: PlanProvider.of(context),
      builder: (context, plans, child) {
        //  2. Kasus 1: Daftar Plan kosong
        if (plans.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.note, size: 100, color: Colors.grey),
              Text(
                'Anda belum memiliki rencana apapun.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          );
        }

        //  3. Kasus 2: Menampilkan daftar Plan
        return ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            return ListTile(
              title: Text(plan.name),
              // subtitle menggunakan getter yang dibuat di Langkah 3, Lab 2
              subtitle: Text(plan.completenessMessage),
              onTap: () {
                //  Navigasi ke PlanScreen
                // Mendorong (push) PlanScreen dan MENGIRIMKAN Plan yang dipilih
                // ke konstruktor PlanScreen.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)),
                );
              },
            );
          },
        );
      },
    );
  }
}
```



## Practical Assignment 3: State on Multiple Screens
1. Complete the lab steps, then document the final results with a GIF and explanation in the file README.md! If you find any errors or issues, please correct them according to the application's purpose.
- i have done yet

2. Based on the Practical 3 that you have done, explain the meaning of the following diagram!

- This diagram illustrates how the widget structure (widget tree) in your application is organized and how it changes when a user navigates, which is the core concept of implementing "Lift State Up".

Initial Structure (Left Side: PlanCreatorScreen)
The left side of the diagram shows the widget structure for the Master View, the screen listing all the Plans (PlanCreatorScreen).

  1. State Root: The application starts with the PlanProvider nested under the MaterialApp. The PlanProvider is the key point, as it holds the global state (ValueNotifier<List<Plan>>). By placing it high up, this state is accessible by all screens below it.

  2. Master View: Below the Provider is the PlanCreatorScreen, which acts as the main container for adding new Plans.

  3. Layout: This screen uses a Column to arrange elements vertically: a TextField for creating a new Plan, and an Expanded widget containing the ListView.

  4. Function: The ListView (implemented in _buildMasterPlans()) is responsible for displaying the list of all Plans. This widget reactively listens to the PlanProvider to display the latest list. .

The Transition (Navigator Push)
When the user taps on a Plan ListTile in the PlanCreatorScreen, a Navigator Push action occurs. This is Flutter's mechanism for placing a new screen (PlanScreen) on top of the current screen in the navigation stack.

Destination Structure (Right Side: PlanScreen)
The right side of the diagram illustrates the widget structure for the Detail View screen, which displays the tasks for a specific Plan (PlanScreen).

  1. State Persists: Note that the MaterialApp and the PlanProvider are not rebuilt or destroyed. The PlanProvider remains at the root, preserving the stable global state.

  2. New Screen: The PlanScreen is pushed onto the navigation stack. Crucially, this screen receives a single Plan object via its constructor as its initial data.

  3. Detail Layout: The PlanScreen uses a Scaffold and a Column for its basic structure.

  4. Detail Content: The Column is divided into an Expanded section (containing the ListView for the specific Plan's tasks) and a SafeArea (containing a Text widget to display the completeness message).

  5. State Access: Although a specific Plan is passed via navigation, all updates (like adding or completing a task) are still performed by accessing the PlanProvider above, searching for the correct Plan within the global List<Plan>, and updating it. .

3. Capture the results of Step 14 as a GIF, then explain what you have created!
-

4. Submit your practicum report in the form of a commit link or GitHub repository to the agreed lecturer!