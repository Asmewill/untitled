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

class AddressEvent {
  String text;
  AddressEvent({this.text = ""});
}


class CheckoutEvent {
  String text;
  CheckoutEvent({this.text = ""});
}

