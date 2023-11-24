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
    // Assuming 10% tax
    double taxRate = 0.1;
    double tax = widget.item.price * taxRate;
    double total = widget.item.price + tax;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Information'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Item Details
              _buildItemDetails(),

              // Section: Payment Information
              _buildPaymentInformation(),

              // Section: Tax and Total
              _buildTaxAndTotal(tax, total),

              // Section: Process Payment Button
              _buildProcessPaymentButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the Item Details section
  Widget _buildItemDetails() {
    return Column(
      children: [
        Text(
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

  // Helper method to build the Payment Information section
  Widget _buildPaymentInformation() {
    return Column(
      children: [
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter card number';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Expiration Date'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter expiration date';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'CVV'),
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

  // Helper method to build the Tax and Total section
  Widget _buildTaxAndTotal(double tax, double total) {
    return Column(
      children: [
        Text(
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

  // Helper method to build the Process Payment Button
  Widget _buildProcessPaymentButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // Form is valid, process the payment
          _processPayment(context);
        }
      },
      child: const Text('Process Payment'),
    );
  }

  // Helper method to process the payment
  void _processPayment(BuildContext context) {
    // Implement the logic for processing the payment
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
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
