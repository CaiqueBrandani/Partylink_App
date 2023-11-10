import 'package:mobx/mobx.dart';
part 'event_store.g.dart';

class EventStore = EventStoreBase with _$EventStore;

abstract class EventStoreBase with Store {

}