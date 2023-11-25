import 'package:flutter/material.dart';
import 'item.dart';

class PaymentPage extends StatefulWidget {
  final Item item;

  const PaymentPage({Key? key, required this.item}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double taxRate = 0.1;
    double tax = widget.item.price * taxRate;
    double total = widget.item.price + tax;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Information'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body:Container(
      decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage('images/rm222-mind-20.jpg'),
      fit: BoxFit.cover,
      ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildItemDetails(),
              _buildPaymentInformation(),
              _buildTaxAndTotal(tax, total),
              _buildProcessPaymentButton(context),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildItemDetails() {
    return Column(
      children: [
        const Text(
          'Item Details:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          title: Text(widget.item.name),
          subtitle: Text('Price: \$${widget.item.price}'),
          trailing: Image.asset(
            widget.item.image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPaymentInformation() {
    return Column(
      children: [
        const Text(
          'Payment Information:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Card Number'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter card number';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Expiration Date'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter expiration date';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'CVV'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter CVV';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildTaxAndTotal(double tax, double total) {
    return Column(
      children: [
        const Text(
          'Tax and Total:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text('Tax (10%): \$${tax.toStringAsFixed(2)}'),
        Text('Total: \$${total.toStringAsFixed(2)}'),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProcessPaymentButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          _processPayment(context);
        }
      },
      child: const Text('Process Payment'),
    );
  }

  void _processPayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: Text('Payment successful for ${widget.item.name}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
