import '../translations.dart';

class PtBr implements Translations {
  @override
  String get loginSuccess => 'Login efetuado com sucesso.';

  @override
  String get appName => 'App de Exemplo';

  @override
  String get loginWithGoogle => 'Entrar com o Google';

  @override
  String get noNotesFound => 'Nenhuma nota encontrada';

  @override
  String get others => 'Outros';

  @override
  String get pinned => 'Fixadas';

  @override
  String get searchNotes => 'Pesquisar notas';

  @override
  String get title => 'Título';

  @override
  String get body => 'Anotação';

  @override
  String get errorCreatingNote => 'Erro ao criar nota.';

  @override
  String get noteCreatedWithSuccess => 'Nota criada com sucesso.';

  @override
  String get noteEditedWithSuccess => 'Nota editada com sucesso.';

  @override
  String get noteIsNull => 'Nota não existe.';

  @override
  String get noteRemovedWithSuccess => 'Nota removida com sucesso.';

  @override
  String get noteNotFound => 'Nota não encontrada.';

  @override
  String get loading => 'Carregando...';
}
