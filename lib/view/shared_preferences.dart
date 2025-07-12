import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesed extends StatefulWidget {
  const SharedPreferencesed({super.key});

  @override
  State<SharedPreferencesed> createState() => _SharedPreferencesedState();
}

class _SharedPreferencesedState extends State<SharedPreferencesed> {

  late int _conter = 0;

  void _conterIncremnt() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      _conter ++;
    });

    pref.setInt("Counter ", _conter);
  }

  @override
  void initState() {
    super.initState();
    loadCounterShredPrefrance();
  }

  Future<void> loadCounterShredPrefrance() async {
        final pref = await SharedPreferences.getInstance();
        setState(() {
          _conter = pref.getInt("Counter") ?? 0;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center
        (child: Text("SharedPreferencesed")),
        backgroundColor: Colors.amber,
        ),
        body: SafeArea(child: 
        Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [
              Text("Counter vale is :- $_conter"),
              SizedBox(height: 80,),
              ElevatedButton(onPressed: _conterIncremnt, child: Text("Click Here"))
            ],
          ),
        )
        
        ),
        
        );
  }
}