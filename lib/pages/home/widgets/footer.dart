part of '../home.dart';

@immutable
class _Footer extends StatelessWidget {
  const _Footer({super.key});

  static List<String> images = [
    Assets.cars.bmwM2Comp2023Black.path,
    Assets.cars.toyotaGr86Trueno.path,
    Assets.cars.bmwM2Comp2023White.path,
    Assets.cars.bmw1SeriesHatchback2017.path,
    Assets.cars.ae86Trueno.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 500,
            maxWidth: 777,
          ),
          child: Image.asset(images.randomElement, fit: BoxFit.fitWidth),
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
      padding: const EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        top: 200.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _FooterLinksColumn(
            key: const Key('footer_links_column_1'),
            title: 'Links',
            links: [
              _AppLinkText(
                'SELF.DEV',
                key: const Key('footer_selfdev_link'),
                url: Links.selfdev,
                fontSize: linkSize,
              ),
            ],
          ),
          _FooterLinksColumn(
            key: const Key('footer_links_column_2'),
            title: 'Connect',
            links: [
              _AppLinkText(
                'GitHub',
                key: const Key('footer_github_link'),
                url: Links.github,
                fontSize: linkSize,
              ),
              _AppLinkText(
                'LinkedIn',
                key: const Key('footer_linkedin_link'),
                url: Links.linkedIn,
                fontSize: linkSize,
              ),
              _AppLinkText(
                'Twitter',
                key: const Key('footer_twitter_link'),
                url: Links.twitter,
                fontSize: linkSize,
              ),
              _AppLinkText(
                'Instagram',
                key: const Key('footer_instagram_link'),
                url: Links.instagram,
                fontSize: linkSize,
              ),
            ],
          ),
        ],
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
    final labelSmall = context.textTheme.bodyMedium;
    final color = labelSmall?.color?.withOpacity(0.2);
    final style = labelSmall?.copyWith(letterSpacing: 1.9);
    const myEmail = 'getsocial@gmail.com';
    return Column(
      children: [
        const SizedBox(height: 30.0),
        Divider(
          color: color?.withOpacity(0.09),
          thickness: 1.0,
          endIndent: 40.0,
          indent: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 30, 40.0, 40.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  context.i18n.craftedByAndAllRightsReserved(year),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: style,
                ),
              ),
              const _AppLinkText(myEmail, url: 'mailto:$myEmail'),
            ],
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
          Text(
            title,
            style: context.textTheme.displaySmall,
          ),
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
    super.key,
  });

  final String label;
  final String url;
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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Text.rich(
        TextSpan(
          text: widget.label,
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
          letterSpacing: 1.9,
          decoration:
              _isHovering ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
