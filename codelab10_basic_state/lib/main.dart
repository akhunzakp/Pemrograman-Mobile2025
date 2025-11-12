// lib/main.dart

import 'package:flutter/material.dart';
//  Pastikan mengimpor PlanCreatorScreen
import './views/plan_creator_screen.dart'; 
import './provider/plan_provider.dart'; 
import './models/data_layer.dart'; 

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []), 
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