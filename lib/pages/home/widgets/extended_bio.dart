part of '../home.dart';

@immutable
class _ExtendedBio extends StatelessWidget {
  const _ExtendedBio({super.key});

  @override
  Widget build(BuildContext context) {
    final displaySmall = context.textTheme.displaySmall;
    return _PageAutoPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 300.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 16.0),
            child: Text(
              context.i18n.imGreaterThanMyName,
              style: displaySmall?.copyWith(
                color: displaySmall.color?.withOpacity(0.3),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -120.0,
                right: -100.0,
                child: Image.asset(Assets.appImages.juliotati.path),
              ),
              Positioned(
                top: 3.0,
                right: -60.0,
                child: Container(
                  height: 160.0,
                  width: 160.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Image.asset(Assets.appImages.julioStare.path),
                ),
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
