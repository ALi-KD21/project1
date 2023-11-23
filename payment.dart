// payment_page.dart
import 'package:flutter/material.dart';
import 'item.dart';


class PaymentPage extends StatelessWidget {
  final Item item;

  const PaymentPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Information'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(item.name),
              subtitle: Text('Price: \$${item.price}'),
              trailing: Image.asset(
                item.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Payment Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Add your payment form fields here
            // For example, you can use TextFormField, CreditCardForm, etc.
            // Example:
            TextFormField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Expiration Date'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement the logic for processing the payment
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Payment Confirmation'),
                      content: Text('Payment successful for ${item.name}.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Process Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
