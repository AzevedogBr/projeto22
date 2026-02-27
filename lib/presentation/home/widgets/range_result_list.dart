import 'package:flutter/material.dart';

class RangeResultList extends StatelessWidget {
  final List<int> numbers;

  const RangeResultList({super.key, required this.numbers});

  @override
  Widget build(BuildContext context) {
    if (numbers.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white12),
        ),
        child: const Row(
          children: [
            Icon(Icons.info_outline_rounded, color: Colors.white30, size: 18),
            SizedBox(width: 10),
            Text(
              'Nenhum número perfeito encontrado.',
              style: TextStyle(color: Colors.white38),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${numbers.length} número${numbers.length != 1 ? 's' : ''} encontrado${numbers.length != 1 ? 's' : ''}',
          style: const TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: numbers.map((n) => _NumberChip(number: n)).toList(),
        ),
      ],
    );
  }
}

class _NumberChip extends StatelessWidget {
  final int number;

  const _NumberChip({required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD600).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFFFFD600).withValues(alpha: 0.5),
        ),
      ),
      child: Text(
        '$number',
        style: const TextStyle(
          color: Color(0xFFFFD600),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
