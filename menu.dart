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
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ShowItems()),
                      );
                    },
                    icon: Icons.shopping_cart,
                    label: "Shop Now",
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 60),
                  _buildElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const HomePage(title: 'Zizo Tech')),
                      );
                    },
                    icon: Icons.home,
                    label: "Home",
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 60),
                  _buildElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Contact()),
                      );
                    },
                    icon: Icons.contacts,
                    label: "Contact us",
                    color: Colors.purple,
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
                child: CircleAvatar(
                  backgroundImage: const AssetImage('images/z.jpg'),
                  radius: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(icon, size: 50),
          const SizedBox(height: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
