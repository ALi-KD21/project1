import 'package:flutter/material.dart';
import 'item.dart';
import 'payment.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({Key? key}) : super(key: key);

  @override
  _ShowItemsState createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  List<bool> selectedItems = List.generate(items.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Items'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          // ... (unchanged code)

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Image.asset(
                              items[index].image,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    items[index].toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                  Checkbox(
                                    value: selectedItems[index],
                                    onChanged: (value) {
                                      setState(() {
                                        selectedItems[index] = value!;
                                      });
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Navigate to the new page when an item is bought
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PaymentPage(item: items[index]),
                                        ),
                                      );
                                    },
                                    child: const Text('Buy Now'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
