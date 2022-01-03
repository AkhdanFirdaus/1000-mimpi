import 'package:flutter/material.dart';
import '../../../core/injection_container.dart';

class SpeakerDetailPage extends StatelessWidget {
  const SpeakerDetailPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SpeakerDetail Page"),
      ),
    );
  }
}
