import '../translations.dart';

class EnUs implements Translations {
  @override
  String get loginSuccess => 'Login successful.';

  @override
  String get appName => 'Sample App';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get noNotesFound => 'No notes found';

  @override
  String get others => 'Others';

  @override
  String get pinned => 'Pinned';

  @override
  String get searchNotes => 'Search notes';

  @override
  String get title => 'Title';

  @override
  String get body => 'Body';

  @override
  String get errorCreatingNote => 'Error creating note.';

  @override
  String get noteCreatedWithSuccess => 'Note created successfully.';

  @override
  String get noteEditedWithSuccess => 'Note edited successfully.';

  @override
  String get noteIsNull => 'Note does not exist.';

  @override
  String get noteRemovedWithSuccess => 'Note removed successfully.';
}
