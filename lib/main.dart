import 'package:final_exam/pages/bottom_nav.dart';
import 'package:final_exam/utils/central_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


main() {
  return runApp(
    ChangeNotifierProvider(
        create: (context) => VegetableStore(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNav(),

        ),
      ),
    
  );
} //ef
