import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> contact;

  DetailScreen({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 231, 231, 231),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              buildDetailRow(icon: Icons.person, label: 'Name', value: contact['name']),
              const SizedBox(height: 20),
              buildDetailRow(icon: Icons.phone, label: 'Number', value: contact['number']),
              const SizedBox(height: 20),
              buildDetailRow(icon: Icons.email, label: 'Email', value: contact['email']),
              const SizedBox(height: 20),
              buildDetailRow(icon: Icons.category, label: 'Category', value: contact['category']),
              const SizedBox(height: 20),
              buildDetailRow(icon: Icons.notes, label: 'Notes', value: contact['notes']),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow({required IconData icon, required String label, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 10),
        Text(
          '$label: $value',
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
