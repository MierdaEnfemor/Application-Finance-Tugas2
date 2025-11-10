import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isExpense = transaction.amount.startsWith('-');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC1E3), // 🌸 pink muda lembut
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpense
              ? const Color.fromARGB(255, 255, 82, 215).withOpacity(0.5)
              : const Color.fromARGB(255, 255, 182, 230).withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: isExpense
              ? Colors.redAccent.withOpacity(0.15)
              : Colors.greenAccent.withOpacity(0.15),
          child: Icon(
            isExpense ? Icons.arrow_downward : Icons.arrow_upward,
            color: isExpense ? Colors.redAccent : Colors.greenAccent,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            color: Color(0xFF1E293B), // teks gelap agar kontras
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          transaction.category,
          style: const TextStyle(
            color: Color(0xFF475569), // abu tua untuk kategori
            fontSize: 13,
          ),
        ),
        trailing: Text(
          transaction.amount,
          style: TextStyle(
            color: isExpense ? Colors.redAccent : Colors.green.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
