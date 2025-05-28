part of '../home.dart';

@immutable
class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final car = Assets.cars.values.randomElement.path;
    log('Current car: 🚙 ${car.split('/').last}');
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 500, maxWidth: 777),
          child: _ChangeLanguageButton(
            child: Image.asset(car, fit: BoxFit.fitWidth),
          ),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FooterLinks(key: Key('app_footer_links')),
            _FooterCopyRights(key: Key('app_footer_copy_rights')),
          ],
        ),
      ],
    );
  }
}

@immutable
class _FooterLinks extends StatelessWidget {
  const _FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    const linkSize = 18.0;
    return Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: _FooterPadding(
        key: const Key('footer_links_padding'),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _FooterLinksColumn(
              key: const Key('footer_links_column_1'),
              title: context.i18n.links,
              links: [
                _AppLinkText(
                  'SELF.DEV',
                  key: const Key('footer_selfdev_link'),
                  url: Links.selfdev,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'Station (${context.i18n.app})',
                  key: const Key('footer_station_link'),
                  url: Links.station,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'Despesas (${context.i18n.app})',
                  key: const Key('footer_despesas_link'),
                  url: Links.despesas,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'Link Target (${context.i18n.package})',
                  key: const Key('footer_link-target_link'),
                  url: Links.linkTarget,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
              ],
            ),
            _FooterLinksColumn(
              key: const Key('footer_links_column_2'),
              title: context.i18n.connect,
              links: [
                _AppLinkText(
                  'GitHub',
                  key: const Key('footer_github_link'),
                  url: Links.github,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'LinkedIn',
                  key: const Key('footer_linkedin_link'),
                  url: Links.linkedIn,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'Twitter',
                  key: const Key('footer_twitter_link'),
                  url: Links.twitter,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
                _AppLinkText(
                  'Instagram',
                  key: const Key('footer_instagram_link'),
                  url: Links.instagram,
                  fontSize: linkSize,
                  enableHyphen: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class _FooterCopyRights extends StatelessWidget {
  const _FooterCopyRights({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year;
    final footer = context.i18n.craftedByAndAllRightsReserved(year).split('|');
    return Column(
      children: [
        const SizedBox(height: 30.0),
        const _FooterDivider(key: Key('footer_divider')),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40.0),
          child: _FooterPadding(
            key: const Key('footer_copy_rights_padding'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _AppLinkText(url: Links.notion, footer.first)),
                _AppLinkText(url: Links.mailTo, footer.last),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

@immutable
class _FooterLinksColumn extends StatelessWidget {
  const _FooterLinksColumn({
    required this.title,
    required this.links,
    super.key,
  });

  final String title;
  final List<_AppLinkText> links;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.displaySmall),
          const SizedBox(height: 20.0),
          ...links.map(
            (link) => Padding(
              padding: const EdgeInsets.only(left: 2.0, bottom: 8.0),
              child: link,
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _AppLinkText extends StatefulWidget {
  const _AppLinkText(
    this.label, {
    required this.url,
    this.fontSize,
    this.enableHyphen = false,
    super.key,
  });

  final String label;
  final String url;
  final bool enableHyphen;
  final double? fontSize;

  @override
  State<_AppLinkText> createState() => _AppLinkTextState();
}

class _AppLinkTextState extends State<_AppLinkText> {
  bool _isHovering = false;

  void _onEnter(PointerEnterEvent event) {
    setState(() => _isHovering = true);
  }

  void _onExit(PointerExitEvent event) {
    setState(() => _isHovering = false);
  }

  String get _linkLabel {
    final isWeekend = DateTime.now().weekday > DateTime.friday;
    final label = widget.label;
    return (widget.enableHyphen && isWeekend) ? '- $label' : label;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: LinkTargetDetector(
        target: widget.url,
        child: Text.rich(
          TextSpan(
            text: _linkLabel.trim(),
            onExit: _onExit,
            onEnter: _onEnter,
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrl(Uri.parse(widget.url)),
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.fade,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: widget.fontSize,
            backgroundColor: widget.enableHyphen
                ? context.theme.scaffoldBackgroundColor.withOpacity(0.55)
                : null,
            letterSpacing: 1.9,
            decoration: _isHovering
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

@immutable
class _FooterPadding extends StatelessWidget {
  const _FooterPadding({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final insets = constraints.maxWidth > 1200 ? 60.0 : 40.0;
        return AppPadding(
          padding: EdgeInsets.symmetric(horizontal: insets),
          child: child,
        );
      },
    );
  }
}

@immutable
class _FooterDivider extends StatelessWidget {
  const _FooterDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final color = context.textTheme.bodyMedium?.color?.withOpacity(0.09);
        final indent = constraints.maxWidth > 1200 ? 0.0 : 40.0;
        return AnimatedContainer(
          height: 1.0,
          color: color,
          width: double.infinity,
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: indent),
        );
      },
    );
  }
}

@immutable
class _ChangeLanguageButton extends StatelessWidget {
  const _ChangeLanguageButton({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: context.read<AppSettingsProvider>().nextLanguage,
        child: child,
      ),
    );
  }
}
