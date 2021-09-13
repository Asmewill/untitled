import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

///商品详情Event
class ProductContentEvent {
  String text;
  ProductContentEvent({this.text = ""});
}


class UserEvent {
  String text;
  UserEvent({this.text = ""});
}
