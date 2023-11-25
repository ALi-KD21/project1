import 'package:flutter/material.dart';
import 'shop.dart';
import 'contact.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/rm222-mind-14.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              children: [
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
                          Icon(Icons.shopping_cart, size: 50, color: Colors.cyan),
                          SizedBox(height: 8.0),
                          Text(
                            "Shop Now",
                            style: TextStyle(color: Colors.cyan),
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
                          Icon(Icons.home, size: 50, color: Colors.cyan),
                          SizedBox(height: 8.0),
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.cyan),
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
                          Icon(Icons.contacts, size: 50, color: Colors.cyan),
                          SizedBox(height: 8.0),
                          Text(
                            "Contact us",
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Welcome to Zizo Tech!\n   A step for the future\n',
                      style: TextStyle(fontSize: 24, color: Colors.cyan),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/z.jpg'),
                    radius: 50,
                  ),
                ),
                const SizedBox(height: 20),
                // Additional descriptive text to attract the user
                const Text(
                  'Discover the latest tech products and innovations at Zizo Tech. '
                      'Our selection of gadgets ensures you stay ahead in the digital world. '
                      'Explore our online store for an unparalleled shopping experience!',
                  style: TextStyle(fontSize: 20, color: Colors.teal),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
