import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child; // 内容
  final double durationSeconds;
  final bool isPlaying;
  final VoidCallback onTap;

  const RotatingWidget({
    super.key,
    required this.child,
    required this.onTap,
    required this.isPlaying,
    this.durationSeconds = 5,
  });

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds.toInt()),
    );

    // 初始化时根据 isPlaying 决定是否转动
    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(RotatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 当 isPlaying 改变时，自动同步旋转状态
    if (widget.isPlaying && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isPlaying && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: RotationTransition(
        turns: _controller,
        child: widget.child,
      ),
    );
  }
}