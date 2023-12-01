import 'package:flutter_application_1/user/user_notifier.dart';
import 'package:flutter_application_1/user/states/state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod/riverpod.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _notifier = ref.watch(userStateNotifierProvider.notifier);

      return _notifier.state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        success: (user) => Scaffold(
          body: Center(
            child: Text("${user.email}"),
          ),
        ),
        error: (e) => Center(
          child: Text("Error occurred, $e"),
        ),
        initial: () => Scaffold(body: Center(child: Text('Initial State'))),
      );
    });
  }
}
    

/*
loading: () => Center(
              child: CircularProgressIndicator(),
            ),
            success: (user) => Center(
              child: Text("${user.email}"),
            ),
            error: (e) => Center(
              child: Text("Error occurred, $e"),
            ),
            orElse: () => Center(
              child: ElevatedButton(
                child: const Text(
                  "Get Single User",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print("or else data");
                },
              ),
            ),
            */