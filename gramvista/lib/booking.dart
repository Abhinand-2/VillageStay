import 'package:flutter/material.dart';

class BookNowPage extends StatelessWidget {
  const BookNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Now'),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bank Account Details',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Beneficiary Name: Athithya Rural Tourism\n'
                  'Bank Name: State Bank of India\n'
                  'Account Number: 1234567890\n'
                  'IFSC Code: SBIN0001234\n'
                  'Branch: MG Road, Bengaluru\n\n'
                  'Note: Once payment is made, kindly email the receipt to bookings@athithya.in',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
