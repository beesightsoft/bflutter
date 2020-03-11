import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final Widget child;
  final bool expand;

  ExpandableWidget({this.expand = false, this.child});

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    handleAnimations();
  }

  @override
  void didUpdateWidget(ExpandableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    handleAnimations();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }

  /// @cuongtlv on Feb/11/2020: Setting animations up
  void initAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.easeInOutBack,
    );
  }

  /// @cuongtlv on Feb/11/2020: Handling expand status of the widget
  void handleAnimations() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }
}
