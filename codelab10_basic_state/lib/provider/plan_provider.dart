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