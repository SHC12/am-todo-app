import 'dart:async';

import 'package:amartha_todo/core/configs/themes/custom_theme.dart';
import 'package:amartha_todo/feature/todo/data/services/local/hive_service.dart';
import 'package:amartha_todo/feature/todo/presentation/modules/home/home_page.dart';
import 'package:amartha_todo/injection/injection.dart' as injection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initConfig();

  runApp(
    const TodoApp(),
  );
}

Future<void> initConfig() async {
  await injection.init();
  HiveService hive = di<HiveService>();
  await hive.init();
  initializeDateFormatting('id_ID', null);
}

class TodoApp extends StatelessWidget {
  const TodoApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        builder: (ctx, child) {
          return MaterialApp(
            title: 'TodoKu',
            darkTheme: CustomTheme().customLight,
            theme: CustomTheme().customLight,
            locale: const Locale('id', 'ID'),
            builder: (context, widget) {
              return MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: const HomePage());
  }
}
