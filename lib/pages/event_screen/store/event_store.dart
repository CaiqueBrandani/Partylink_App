import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:partylink/model/event_model.dart';
part 'event_store.g.dart';

class EventStore = EventStoreBase with _$EventStore;

abstract class EventStoreBase with Store {
  ObservableList<Event> eventList = ObservableList<Event>();
  ObservableList<Event> eventListAux = ObservableList<Event>();

  @action
  void addEventList(value) {
    eventList.clear();
    eventListAux.clear();

    final parsed = json.decode(value);

    if (parsed != null) {
      for (var i = 0; i < parsed['data'].length; i++) {
        try {
          Event event = Event.fromJson(parsed['data'][i]);

          eventList.add(event);
        } catch (e) {
          log('ERRO AO ADICIONAR PRODUTO >>> $e');
        }
      }
      eventListAux.addAll(eventList);
    }
  }
}