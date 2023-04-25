import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  String _formName = '', _formAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                  onChanged: (nameFromForm) {
                    _formName = nameFromForm;
                  }),
              TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                  onChanged: (ageFromForm) {
                    _formAge = ageFromForm;
                  }),
              ElevatedButton(
                onPressed: () {
                  User user = User(name: _formName, age: _formAge);
                  Route route = MaterialPageRoute(
                      builder: (context) => SecondPage(user: user));
                  Navigator.push(context, route);
                },
                child: const Text('Second Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final User? user;
  const SecondPage({super.key, this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Имя пользователя: ${user!.name}'),
              Text('Возраст пользователя: ${user!.age}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('First Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final String? name, age;

  User({this.name, this.age});
}
