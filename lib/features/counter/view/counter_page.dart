// Flutter imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:flutter_template/app/view/app.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

class CounterView extends HookConsumerWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Flutter Template',
          style: textTheme.headline2,
          maxLines: 1,
        ),
      ),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'Increment',
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            tooltip: 'Decrement',
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends HookConsumerWidget {
  const CounterText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final count = ref.watch(counterProvider);
    return Text('${count.count}', style: theme.textTheme.headline1);
  }
}
