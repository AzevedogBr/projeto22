import 'package:flutter/material.dart';
import 'package:projeto22/presentation/home/widgets/app_card.dart';
import 'package:projeto22/presentation/home/widgets/number_field.dart';
import 'package:projeto22/presentation/home/widgets/range_result_list.dart';
import 'package:projeto22/presentation/home/bloc/home_cubit.dart';

class RangeCard extends StatefulWidget {
  final RangeStatus status;
  final List<int> results;
  final void Function(int start, int end) onSubmit;

  const RangeCard({
    super.key,
    required this.status,
    required this.results,
    required this.onSubmit,
  });

  @override
  State<RangeCard> createState() => _RangeCardState();
}

class _RangeCardState extends State<RangeCard> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  void _submit() {
    final start = int.tryParse(_startController.text.trim());
    final end = int.tryParse(_endController.text.trim());
    if (start == null || end == null) return;
    widget.onSubmit(start, end);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: 'Buscar em intervalo',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: NumberField(controller: _startController, label: 'De'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NumberField(
                  controller: _endController,
                  label: 'Até',
                  onSubmitted: (_) => _submit(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: _submit,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFFFD600),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'BUSCAR',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
          if (widget.status == RangeStatus.loading)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFD600),
                  strokeWidth: 2,
                ),
              ),
            ),
          if (widget.status == RangeStatus.done) ...[
            const SizedBox(height: 16),
            RangeResultList(numbers: widget.results),
          ],
        ],
      ),
    );
  }
}
