import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/*

//EXEMPLO 1

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exemplo Provider')),
        body: Center(
          child: Consumer<CounterModel>(
            builder: (context, counter, child) => Text('Contador: ${counter.count}'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterModel>().increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
*/
/*

//EXEMPLO 2

class UserModel extends ChangeNotifier {
  String _name = 'Usuário';

  String get name => _name;

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => CounterModel()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo MultiProvider')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserModel>(
              builder: (context, user, child) => Text('Usuário: ${user.name}'),
            ),
            Consumer<CounterModel>(
              builder: (context, counter, child) => Text('Contador: ${counter.count}'),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<UserModel>().changeName('Novo Nome'),
              child: Icon(Icons.person),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => context.read<CounterModel>().increment(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*

//EXEMPLO 3

class UserModel extends ChangeNotifier {
  String _name = 'Usuário';

  String get name => _name;

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ConfigureProviders {
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {

    final counterModel = CounterModel();
    final userModel = UserModel();

    return ConfigureProviders(providers: [
      ChangeNotifierProvider<CounterModel>.value(value: counterModel),
      ChangeNotifierProvider<UserModel>.value(value: userModel),
    ]);
  }
}


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final data = await ConfigureProviders.createDependencyTree();

  runApp(
    MultiProvider(
      providers: data.providers,
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserModel userModel  = Provider.of<UserModel>(context, listen: true);
    CounterModel counterModel  = Provider.of<CounterModel>(context, listen: true);


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Exemplo MultiProvider')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Usuário: ${userModel.name}'),
            Text('Contador: ${counterModel.count}'),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => userModel.changeName('Novo Nome'),
              child: Icon(Icons.person),
            ),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () => counterModel.increment(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
*/