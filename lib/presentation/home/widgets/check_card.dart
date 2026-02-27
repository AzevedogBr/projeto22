import 'package:flutter/material.dart';
import 'package:projeto22/presentation/home/widgets/app_card.dart';
import 'package:projeto22/presentation/home/widgets/number_field.dart';
import 'package:projeto22/presentation/home/widgets/result_badge.dart';
import 'package:projeto22/presentation/home/bloc/home_cubit.dart';

class CheckCard extends StatefulWidget {
  final CheckStatus status;
  final int? checkedNumber;
  final void Function(int n) onSubmit;

  const CheckCard({
    super.key,
    required this.status,
    required this.checkedNumber,
    required this.onSubmit,
  });

  @override
  State<CheckCard> createState() => _CheckCardState();
}

class _CheckCardState extends State<CheckCard> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final n = int.tryParse(_controller.text.trim());
    if (n == null) return;
    widget.onSubmit(n);
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: 'Verificar número',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NumberField(
            controller: _controller,
            label: 'Digite um número',
            onSubmitted: (_) => _submit(),
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
              'VERIFICAR',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ),
          if (widget.status != CheckStatus.initial) ...[
            const SizedBox(height: 16),
            ResultBadge(
              isPerfect: widget.status == CheckStatus.perfect,
              message: widget.status == CheckStatus.perfect
                  ? '${widget.checkedNumber} é um número perfeito!'
                  : '${widget.checkedNumber} não é um número perfeito.',
            ),
          ],
        ],
      ),
    );
  }
}
