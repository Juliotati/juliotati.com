part of '../home.dart';

@immutable
class _ActionableValues extends StatelessWidget {
  const _ActionableValues({super.key});

  static List<_Actionable> _actionableItems(
    AppLocal i18n, {
    double explorePadding = 0.0,
    double learnPadding = 0.0,
    double discoverPadding = 0.0,
    double createPadding = 0.0,
    double tunePadding = 0.0,
    double masterPadding = 0.0,
  }) {
    return [
      _Actionable(
        key: const Key('actionable_explore'),
        title: i18n.actionableExplore,
        description: i18n.actionableExploreDescription,
        leftPadding: explorePadding,
      ),
      _Actionable(
        key: const Key('actionable_learn'),
        title: i18n.actionableLearn,
        description: i18n.actionableLearnDescription,
        leftPadding: learnPadding,
      ),
      _Actionable(
        key: const Key('actionable_discover'),
        title: i18n.actionableDiscover,
        description: i18n.actionableDiscoverDescription,
        leftPadding: discoverPadding,
      ),
      _Actionable(
        key: const Key('actionable_create'),
        title: i18n.actionableCreate,
        description: i18n.actionableCreateDescription,
        leftPadding: createPadding,
      ),
      _Actionable(
        key: const Key('actionable_tune'),
        title: i18n.actionableTune,
        description: i18n.actionableTuneDescription,
        leftPadding: tunePadding,
      ),
      _Actionable(
        key: const Key('actionable_master'),
        title: i18n.actionableMaster,
        description: i18n.actionableMasterDescription,
        leftPadding: masterPadding,
      ),
    ];
  }

  Widget _actionableImage({
    required double height,
    required double width,
    required double radius,
  }) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(Assets.appImages.kingdomNoBg.path, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displaySmall = context.textTheme.displaySmall;
    return LayoutBuilder(
      builder: (context, constraints) {
        final smallScreen = constraints.maxWidth < 1200;
        if (smallScreen) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 150.0),
              _actionableImage(width: 550.0, height: 320.0, radius: 80.0),
              const SizedBox(height: 50.0),
              Wrap(children: _actionableItems(context.i18n)),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                _actionableImage(height: 300.0, width: 450.0, radius: 100.0),
                const SizedBox(height: 50.0),
                Text(
                  context.i18n.myMotto,
                  style: displaySmall?.copyWith(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: displaySmall.color?.withOpacity(0.3),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200.0),
                ..._actionableItems(
                  context.i18n,
                  learnPadding: 30.0,
                  discoverPadding: 30.0,
                  createPadding: 60.0,
                  tunePadding: 120.0,
                  masterPadding: 90.0,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

@immutable
class _Actionable extends StatelessWidget {
  const _Actionable({
    required this.title,
    required this.description,
    this.leftPadding = 0.0,
    super.key,
  });

  final String title;
  final String description;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    final displaySmall = context.textTheme.displaySmall;
    return AppPadding(
      padding: EdgeInsets.only(left: leftPadding),
      child: OnHover(
        builder: (bool isHovering) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: displaySmall?.copyWith(
                    color: displaySmall.color?.withOpacity(0.3),
                  ),
                ),
                const SizedBox(width: 20.0),
                Card(
                  elevation: isHovering ? 20.0 : null,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      '—  $description',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
