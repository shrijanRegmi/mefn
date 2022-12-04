import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyBuilder extends StatefulWidget {
  final String? lottieUrl;
  final String? title;
  final String? subTitle;
  final int animationDuration;

  const EmptyBuilder({
    Key? key,
    this.lottieUrl,
    this.title,
    this.subTitle,
    this.animationDuration = 3000,
  }) : super(key: key);

  @override
  State<EmptyBuilder> createState() => _EmptyBuilderState();
}

class _EmptyBuilderState extends State<EmptyBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.animationDuration,
      ),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              widget.lottieUrl ?? 'assets/lotties/no_results.json',
              width: MediaQuery.of(context).size.width - 150.0,
              height: MediaQuery.of(context).size.width - 150.0,
              controller: _animationController,
              onLoaded: (comp) {
                _animationController
                  ..duration = Duration(milliseconds: widget.animationDuration)
                  ..repeat();
              },
            ),
            if (widget.title != null)
              Text(
                '${widget.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(
              height: 10.0,
            ),
            if (widget.subTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '${widget.subTitle}',
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
