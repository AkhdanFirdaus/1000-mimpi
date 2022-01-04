import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seribu_mimpi/features/auth/index.dart';

final speakerProvider =
    StateNotifierProvider<SpeakerNotifier, List<User>>((ref) {
  return SpeakerNotifier();
});

class SpeakerNotifier extends StateNotifier<List<User>> {
  SpeakerNotifier([List<User>? state])
      : super(
            [User(asal: "", email: "", name: "", notelp: "", role: 0, id: 0)]);

  void addSpeaker() {
    state = [
      ...state,
      User(
          asal: "",
          email: "",
          name: "",
          notelp: "",
          role: 0,
          id: state.last.id + 1)
    ];
  }

  void removeSpeaker(User e) {
    if (state.length > 1) {
      state = state.where((element) => element != e).toList();
    }
  }

  void setAsal(int id, String asal) {
    state = [
      for (final e in state)
        if (e.id == id) e.copyWith(asal: asal) else e
    ];
  }

  void setEmail(int id, String email) {
    state = [
      for (final e in state)
        if (e.id == id) e.copyWith(email: email) else e
    ];
  }

  void setNama(int id, String name) {
    state = [
      for (final e in state)
        if (e.id == id) e.copyWith(name: name) else e
    ];
  }

  void setNoTelp(int id, String notelp) {
    state = [
      for (final e in state)
        if (e.id == id) e.copyWith(notelp: notelp) else e
    ];
  }
}
