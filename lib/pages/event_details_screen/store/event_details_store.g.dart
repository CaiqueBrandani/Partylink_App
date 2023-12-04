// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventDetailsStore on EventDetailsStoreBase, Store {
  late final _$eventSelecAtom =
      Atom(name: 'EventDetailsStoreBase.eventSelec', context: context);

  @override
  dynamic get eventSelec {
    _$eventSelecAtom.reportRead();
    return super.eventSelec;
  }

  @override
  set eventSelec(dynamic value) {
    _$eventSelecAtom.reportWrite(value, super.eventSelec, () {
      super.eventSelec = value;
    });
  }

  late final _$EventDetailsStoreBaseActionController =
      ActionController(name: 'EventDetailsStoreBase', context: context);

  @override
  dynamic setEventSelec(dynamic value) {
    final _$actionInfo = _$EventDetailsStoreBaseActionController.startAction(
        name: 'EventDetailsStoreBase.setEventSelec');
    try {
      return super.setEventSelec(value);
    } finally {
      _$EventDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
eventSelec: ${eventSelec}
    ''';
  }
}
