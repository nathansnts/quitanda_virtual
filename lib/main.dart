import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://kalzvarvpitoloaxslfd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImthbHp2YXJ2cGl0b2xvYXhzbGZkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDEzMDg5NjcsImV4cCI6MjAxNjg4NDk2N30.v7WBFIPe7xaxBLoMyoFBXUq6aa2pqwx646t2-NYVP4g',
  );

  final data = await supabase.from('Products').select('*');

  print(data);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quitanda Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(),
    );
  }
}
