import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactivity_test/services/country_service.dart';
import 'package:reactivity_test/states/country_state.dart';
import 'package:reactivity_test/stores/country_store.dart';
import 'package:uno/uno.dart';
import 'controllers/counter.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        Provider(create: (_) => Uno()),
        Provider(create: (context) => CountryService(context.read())),
        ChangeNotifierProvider(create:(context) => CountryStore(context.read()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: "Flutter Demo Home Page"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final store = CountryStore(CountryService(Uno()));
  final formatNumber = NumberFormat("#,##0.00", "pt_BR");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Avoid loading before the widget exists
    WidgetsBinding.instance.addPostFrameCallback((_){
      context.read<CountryStore>().fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<CountryStore>();
    final state = store.value;
    Widget? child;

    if (state is LoadingCountryState) {
      child = const Center(child: CircularProgressIndicator());
    }

    if (state is ErrorCountryState) {
      child = Center(child: Text(state.message));
    }

    if (state is SuccessCountryState) {
      child = ListView.builder(
        itemCount: state.countries.length,
        itemBuilder: (_, index) {
          final country = state.countries[index];
          return ListTile(
              textColor: Theme.of(context).primaryColorDark,
              title: Text("Nation: ${country.nation} - Year: ${country.year}", textAlign: TextAlign.center),
              subtitle: Text("Population: ${formatNumber.format(country.population)}", textAlign: TextAlign.center),
              leading: const Icon(Icons.flag)
          );
        });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("${widget.title} - ${context.watch<Counter>().value}"),
      ),
      body: child ?? const Center(child: Icon(Icons.error_outline)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {context.read<Counter>().increment()},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CountryCard extends StatefulWidget {
  const CountryCard({super.key, required this.title});

  final String title;

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Card(
      child: Text(widget.title),
    ));
  }
}
