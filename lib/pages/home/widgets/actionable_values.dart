part of '../home.dart';

@immutable
class _ActionableValues extends StatelessWidget {
  const _ActionableValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 450.0,
          height: 300.0,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Image.asset(
            Assets.appImages.kingdom.path,
            fit: BoxFit.cover,
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 200.0),
            _Actionable(
              title: 'Explore',
              description: 'Explore The world and its wonders',
            ),
            _Actionable(
              title: 'Learn',
              description: 'Learn as you know not all',
            ),
            _Actionable(
              title: 'Discover',
              description: 'Discover new paths',
            ),
            _Actionable(
              title: 'Create',
              description: 'Create with your imagination',
            ),
            _Actionable(
              title: 'Tune',
              description: 'Tune your craft',
            ),
            _Actionable(
              title: 'Master',
              description: 'Master your own craft',
            ),
          ],
        ),
      ],
    );
  }
}

@immutable
class _Actionable extends StatelessWidget {
  const _Actionable({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovering) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.end,
                style: context.textTheme.displaySmall,
              ),
              const SizedBox(width: 20.0),
              Card(
                elevation: isHovering ? 20.0 : null,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '—  $description',
                    softWrap: true,
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
