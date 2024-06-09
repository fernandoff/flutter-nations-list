import 'package:flutter/material.dart';
import 'package:reactivity_test/services/country_service.dart';
import 'package:reactivity_test/states/country_state.dart';
import 'package:reactivity_test/stores/country_store.dart';
import 'package:uno/uno.dart';
import 'controllers/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final counter = Counter();
  final store = CountryStore(CountryService(Uno()));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.fetchCountries();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   counter.addListener(() {
  //     setState((){});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child:
                ValueListenableBuilder(
                  valueListenable: store,
                  builder: (_, state, child){
                    if(state is LoadingCountryState){
                      return const Center(
                        child: CircularProgressIndicator()
                      );
                    }

                    if(state is ErrorCountryState){
                      return Center(child: Text(state.message));
                    }

                    if(state is SuccessCountryState) {
                      return ListView.builder(
                        itemCount: state.countries.length,
                        itemBuilder: (_, index) {
                          final country = state.countries[index];
                          return ListTile(
                            title: Text("Nation: ${country.nation}"),
                            subtitle: Text("Population: ${country.population}"),
                            leading: const Icon(Icons.flag),
                            // title: CountryCard(
                            //     title: country.nation
                            // )
                          );
                        }
                      );

                    }

                    return const Center(child: Text("Failed loading country"));
                  }
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
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
    return(Card(
      child: Text(widget.title),
    ));
  }
}

