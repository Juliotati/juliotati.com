part of '../home.dart';

@immutable
class _ExtendedBio extends StatelessWidget {
  const _ExtendedBio({super.key});

  @override
  Widget build(BuildContext context) {
    return _PageAutoPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 300.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 16.0),
            child: Text(
              context.i18n.longBioTitle,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 20.0,
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -150.0,
                right: -150.0,
                child: Image.asset(Assets.appImages.juliotati.path),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 790.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      context.i18n.longBio,
                      softWrap: true,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
