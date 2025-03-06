import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class InvestmentDetailsPage extends ConsumerWidget {
  const InvestmentDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Details'),
      ),
      body: const Center(
        child: Text('Investment Details Page - Coming Soon'),
      ),
    );
  }
} 