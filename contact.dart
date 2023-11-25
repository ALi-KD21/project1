import 'package:flutter/material.dart';
import 'shop.dart';
import 'menu.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/rm222-mind-14.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              const Text(
                'Meet the Creators',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              _buildCreatorsInfo("Ali Amareddine", "ali.jpg", '+96181092171', '12131317@students.liu.edu.lb'),
              const SizedBox(height: 20),
              _buildCreatorsInfo("Mohammad Zahran", "zizo.jpg", '+96176749822', '12130906@students.liu.edu.lb'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreatorsInfo(String name, String image, String phone, String email) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("images/$image"),
          radius: 60,
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.phone, color: Colors.cyan),
            const SizedBox(width: 5),
            Text(
              phone,
              style: const TextStyle(color: Colors.cyan),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, color: Colors.cyan),
            const SizedBox(width: 5),
            Text(
              email,
              style: const TextStyle(color: Colors.cyan),
            ),
          ],
        ),
      ],
    );
  }
}
