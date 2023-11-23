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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ShowItems()),
                      );
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.shopping_cart, size: 50,),
                        const SizedBox(height: 8.0),
                        const Text("Shop Now"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  ElevatedButton(
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
                  const SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Contact()),
                      );
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.contacts, size: 50,),
                        const SizedBox(height: 8.0),
                        const Text("Contact us"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: const Text(
                    'Welcome to Zizo Tech!\n   A step for the future\n',
                    style: TextStyle(fontSize: 24, color: Colors.cyan),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 150,
                child: Image(
                  image: AssetImage('images/z.jpg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}