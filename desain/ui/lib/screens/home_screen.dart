import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Mate'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 224, 132, 192),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Title =====
            const Text(
              'My Cards',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ===== Banner Cards =====
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank BSI',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color.fromARGB(255, 212, 98, 155),
                    color2: Color.fromARGB(255, 245, 245, 244),
                  ),
                  AtmCard(
                    bankName: 'Bank BCA',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color.fromARGB(255, 212, 98, 155),
                    color2: Color.fromARGB(255, 244, 242, 243),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Grid Menu =====
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
              ],
            ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Grid Menu Item Widget ----
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color.fromARGB(
            255,
            229,
            142,
            196,
          ).withOpacity(0.1),
          child: Icon(icon, color: const Color.fromARGB(255, 183, 58, 127)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
