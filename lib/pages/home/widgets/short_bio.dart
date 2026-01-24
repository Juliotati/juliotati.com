part of '../home.dart';

@immutable
class _ShortBio extends StatelessWidget {
  const _ShortBio({super.key});

  @override
  Widget build(BuildContext context) {
    final displaySmall = context.textTheme.displaySmall;
    return _PageAutoPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 250.0),
          const _ShortBioRotatingText(key: Key('short_bio_rotating_text')),
          Text(
            context.i18n.tldr,
            style: displaySmall?.copyWith(
              color: displaySmall.color?.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 10.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900.0),
            child: Text(
              context.i18n.tldrCaption,
              style: context.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
class _ShortBioRotatingText extends StatefulWidget {
  const _ShortBioRotatingText({super.key});

  @override
  State<_ShortBioRotatingText> createState() => _ShortBioRotatingTextState();
}

class _ShortBioRotatingTextState extends State<_ShortBioRotatingText> {
  String _currentText = '';
  int _currentTextIndex = 0;

  Timer? _timer;

  List<String> get _rotatingTexts {
    return [
      context.i18n.bioSoftwareCraftsman,
      context.i18n.bioJoyMachine,
      context.i18n.bioDartShooter,
      context.i18n.bioOtakuOverlord,
      context.i18n.bioStoryteller,
      context.i18n.bioWeebMaster,
      context.i18n.bioLoudIntrovert,
      context.i18n.bioMatrixBurner,
    ];
  }

  String get currentText => _rotatingTexts[_currentTextIndex];

  void _rotateText() {
    _currentText = currentText;
    if (_timer?.isActive == true) {
      _timer?.cancel();
    }
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      log('prev: $_currentText');
      setState(() {
        _currentTextIndex = (_currentTextIndex + 1) % _rotatingTexts.length;
        _currentText = currentText;
      });
      log('next: $_currentText');
    });
  }

  @override
  void didChangeDependencies() {
    _rotateText();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
        child: Align(
          key: ValueKey<String>(_currentText),
          alignment: Alignment.centerLeft,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  context.colorScheme.primary,
                  context.colorScheme.primary,
                  Colors.blue.shade600,
                  Colors.greenAccent,
                  Colors.greenAccent.shade700,
                ],
              ).createShader(bounds);
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                final smallScreen = constraints.maxWidth < 800;
                final mobileScreen = constraints.maxWidth < 650;
                final fontSize = mobileScreen
                    ? 50.0
                    : smallScreen
                    ? 70.0
                    : 85.0;
                return Text(
                  _currentText,
                  key: ValueKey<String>(_currentText),
                  textAlign: TextAlign.start,
                  maxLines: smallScreen ? 2 : 1,
                  softWrap: smallScreen,
                  overflow: TextOverflow.fade,
                  style: context.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: fontSize,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
