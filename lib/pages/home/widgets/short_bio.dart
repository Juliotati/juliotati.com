part of '../home.dart';

@immutable
class _ShortBio extends StatelessWidget {
  const _ShortBio({super.key});

  @override
  Widget build(BuildContext context) {
    return _PageAutoPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 300.0),
          Text(
            context.i18n.shortBioGreeting,
            style: context.textTheme.displaySmall?.copyWith(
              fontSize: 20.0,
            ),
          ),
          Text(
            context.i18n.shortBioWho,
            style: context.textTheme.displayMedium,
          ),
          const _ShortBioRotatingText(key: Key('short_bio_rotating_text')),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900.0),
            child: Text(
              context.i18n.shortBioCaption,
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

  String get currentText => _rotatingTexts[_currentTextIndex];

  final List<String> _rotatingTexts = [
    'Software Craftsman ⚒️',
    'Joy machine 😎',
    'Dart Shooter 🎯',
    'OTAKU Overlord 🤫',
    'Storyteller 📚',
    'WEEB Master 🍱',
    'LOUD introvert 🗿',
  ];

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
  void initState() {
    _rotateText();
    super.initState();
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
              return  LinearGradient(
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
            child: Text(
              _currentText,
              key: ValueKey<String>(_currentText),
              textAlign: TextAlign.start,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.fade,
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 80.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
