import 'package:flutter/material.dart';
import 'item.dart';
import 'payment.dart';
import 'contact.dart';
import 'menu.dart';

class ShowItems extends StatefulWidget {
  const ShowItems({Key? key}) : super(key: key);

  @override
  _ShowItemsState createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  List<bool> selectedItems = List.generate(items.length, (index) => false);
  List<Item> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Items'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              _navigateToCart();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ShowItems()),
                  );
                },
                child: Column(
                  children: [
                    const Icon(Icons.shopping_cart, size: 50),
                    const SizedBox(height: 8.0),
                    const Text("Shop Now"),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage(title: 'Zizo Tech')),
                  );
                },
                child: Column(
                  children: [
                    const Icon(Icons.home, size: 50),
                    const SizedBox(height: 8.0),
                    const Text("Home"),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Contact()),
                  );
                },
                child: Column(
                  children: [
                    const Icon(Icons.contacts, size: 50),
                    const SizedBox(height: 8.0),
                    const Text("Contact us"),
                  ],
                ),
              ),
            ],
          ),
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
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                        ),
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
                                      const SizedBox(width: 10),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                        ),
                                        onPressed: () {
                                          // Toggle the selected state of the item
                                          setState(() {
                                            selectedItems[index] = !selectedItems[index];

                                            // If the item is selected, add it to the cart
                                            if (selectedItems[index]) {
                                              cartItems.add(items[index]);
                                            } else {
                                              cartItems.remove(items[index]);
                                            }
                                          });
                                        },
                                        child: Text(selectedItems[index] ? 'Remove from Cart' : 'Add to Cart'),
                                      ),
                                    ],
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

  void _navigateToCart() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShoppingCart(cartItems: cartItems),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final List<Item> cartItems;

  const ShoppingCart({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('Price: \$${cartItems[index].price}'),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                // Navigate to the payment page when the "Buy Now" button is pressed
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(item: cartItems[index]),
                  ),
                );
              },
              child: const Text('Buy Now'),
            ),
          );
        },
      ),
    );
  }
}
