import 'package:flutter/material.dart';
import 'package:flutter_provider_tutorial/provider/list_provider.dart';
import 'package:flutter_provider_tutorial/second.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //to access the numberslist in provider we use consumer with type <provider name>
    // & using Model we can access the var and func inside the provider
    return Consumer<NumbersListProvider>(
        builder: (context, numbersProviderModel, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  numbersProviderModel.add();
                },
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(),
              body: SizedBox(
                child: Column(
                  children: [
                    Text(numbersProviderModel.numbers.last.toString(),
                        style: const TextStyle(fontSize: 30)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: numbersProviderModel.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                            numbersProviderModel.numbers[index].toString(),
                            style: const TextStyle(fontSize: 30),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Second(),
                            ));
                          },
                          child: const Text('Second')),
                    )
                  ],
                ),
              ),
            ));
  }
}
