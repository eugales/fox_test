import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_app/features/auth/auth_inh_widget.dart';
import 'package:test_app/features/auth/auth_page.dart';
import 'package:test_app/features/date_picker/date_picker_page.dart';
import 'package:test_app/features/table_calendar/table_calendar_page.dart';
import 'package:test_app/features/transaction_history/transaction_history_page.dart';
import 'package:test_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AuthScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: FirebaseAuth.instance.currentUser,
              stream: AuthScope.of(context)?.authStateChanges,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                }
                return const Text('No authorized');
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(TransactionHistoryPage.navigate(context));
              },
              child: const Text('Transaction History Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(DatePickerPage.page(context));
              },
              child: const Text('Date Picker Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(TableCalendarPage.page(context));
              },
              child: const Text('Table Calendar Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(AuthPage.page(context));
              },
              child: const Text('Auth Inh Model Page'),
            ),
          ],
        ),
      ),
    );
  }
}
