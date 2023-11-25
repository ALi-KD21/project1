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
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              _navigateToCart();
            },
          ),
        ],
      ),
      body:Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage('images/rm222-mind-20.jpg'),
      fit: BoxFit.cover,
      ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ShowItems()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.cyan, backgroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.shopping_cart, size: 50, color: Colors.purpleAccent),
                    SizedBox(height: 8.0),
                    Text(
                      "Shop Now",
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage(title: 'Zizo Tech')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.cyan, backgroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.home, size: 50, color: Colors.purpleAccent),
                    SizedBox(height: 8.0),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Contact()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.cyan, backgroundColor: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.contacts, size: 50, color: Colors.purpleAccent),
                    SizedBox(height: 8.0),
                    Text(
                      "Contact us",
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
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
                                    style: const TextStyle(
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
                                          backgroundColor: Colors.purple,
                                        ),
                                        onPressed: () {
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
                                          backgroundColor: Colors.deepPurple,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            selectedItems[index] = !selectedItems[index];
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
        backgroundColor: Colors.deepPurple,
      ),
      body:Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage('images/rm222-mind-20.jpg'),
      fit: BoxFit.cover,
      ),
      ),
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartItems[index].name),
            subtitle: Text('Price: \$${cartItems[index].price}'),
            leading: Image.asset(
              cartItems[index].image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
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
      ),
    );
  }
}

