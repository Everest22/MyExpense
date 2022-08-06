import 'package:flutter/material.dart';
import 'model/transaction.dart';
import 'package:intl/intl.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  _addNewTransaction(String txTtile, double txAmount){
    final newTx = Transaction(
        id: 'Hs',
        title: txTtile,
        amount: txAmount,
        date: DateTime.now(),
    );
    setState(() {
      transactions.add(newTx);
    });
  }

  List<Transaction> transactions = [
    Transaction(id: 't1', title: 'books', amount: 255, date: DateTime.now()),
    Transaction(id: 't2', title: 'nasta', amount: 100, date: DateTime.now()),
    Transaction(id: 't3', title: 'park', amount: 255, date: DateTime.now()),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expense'),
      ),
       body: Column(
         children: [
           Card(
             child: Column(
               children: [
                 TextField(
                   controller: titleController,
                   decoration: InputDecoration(
                     hintText: 'Title',
                   ),
                 ),
                 TextField(
                   controller: amountController,
                   decoration: InputDecoration(
                     labelText: 'Amount',
                   ),
                 ),
                 ElevatedButton(onPressed: () {
                   _addNewTransaction(titleController.text, double.parse(amountController.text));
                 }, child: Text('Submit')),
               ],
             ),
           ),
           Expanded(
            child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                  elevation: 5,
                  child: ListTile(
                      title: Text('${transactions[index].title}'),
                      subtitle: Text('${DateFormat('yyyy-MM-dd').format(transactions[index].date)}'),
                      trailing: Text('${transactions[index].amount}'),
                  ),
                  );
                  }
            ),
            ),
        ],
       ),
    );
  }
}
