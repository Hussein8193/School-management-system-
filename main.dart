import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/l10n.dart';
import 'core/theme.dart';
import 'features/splash.dart';

const _url = String.fromEnvironment('SUPABASE_URL');
const _key = String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  assert(_url.isNotEmpty && _key.isNotEmpty,
      'Run with --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...');
  await Supabase.initialize(url: _url, anonKey: _key);
  runApp(const MhnApp());
}

class MhnApp extends StatelessWidget {
  const MhnApp({super.key});
  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: appState,
        builder: (_, __) => MaterialApp(
          title: Brand.schoolName,
          debugShowCheckedModeBanner: false,
          themeMode: appState.mode,
          theme: Brand.theme(Brightness.light),
          darkTheme: Brand.theme(Brightness.dark),
          home: const SplashPage(),
        ),
      );
}
