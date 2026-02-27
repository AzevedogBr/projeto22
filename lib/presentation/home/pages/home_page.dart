import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto22/presentation/home/bloc/home_cubit.dart';

import 'package:projeto22/presentation/home/widgets/check_card.dart';
import 'package:projeto22/presentation/home/widgets/range_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF111111),
          elevation: 0,
          title: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'ROCK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    color: Color(0xFFFFD600),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CheckCard(
                    status: state.checkStatus,
                    checkedNumber: state.checkedNumber,
                    onSubmit: context.read<HomeCubit>().checkNumber,
                  ),
                  const SizedBox(height: 20),
                  RangeCard(
                    status: state.rangeStatus,
                    results: state.perfectsInRange,
                    onSubmit: context.read<HomeCubit>().findInRange,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
