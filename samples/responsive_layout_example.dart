import 'package:flutter/material.dart';

/// A small, dependency-free example of the responsive composition pattern.
class ResponsiveFeatureShell extends StatelessWidget {
  const ResponsiveFeatureShell({
    required this.title,
    required this.primary,
    required this.secondary,
    super.key,
  });

  final String title;
  final Widget primary;
  final Widget secondary;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 900;

        if (!isWide) {
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              primary,
              const SizedBox(height: 16),
              secondary,
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(32),
              sliver: SliverToBoxAdapter(
                child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              sliver: SliverToBoxAdapter(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: primary),
                    const SizedBox(width: 24),
                    Expanded(child: secondary),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
