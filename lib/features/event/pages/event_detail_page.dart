import 'package:flutter/material.dart';
import '../../../core/injection_container.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("EventDetail Page"),
      ),
    );
  }
}
