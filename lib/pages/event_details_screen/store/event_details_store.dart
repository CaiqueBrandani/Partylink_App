import 'package:mobx/mobx.dart';
import 'package:partylink/model/product_model.dart';
import 'package:partylink/pages/home_screen/store/home_store.dart';
part 'event_details_store.g.dart';

class EventDetailsStore = EventDetailsStoreBase with _$EventDetailsStore;

abstract class EventDetailsStoreBase with Store {
  @observable
  var eventSelec;

  @observable
  double individualOrderValue = 0.0;

  @observable
  List<double> orderValue = [];

  @observable
  double totalValueOrder = 0.0;

  @observable
  ObservableList<Product> temporaryProducts = ObservableList<Product>();

  @action
  setEventSelec(value) => eventSelec = value;

  @action
  void setTemporaryProducts(List<Product> products) {
    temporaryProducts.clear();
    temporaryProducts.addAll(products);
  }

  @action
  void filterProducts(HomeStore homeStore, List<int> desiredIds) {
    List<Product> filteredProducts = homeStore.productListAux
        .where((product) => desiredIds.contains(product.id))
        .toList();

    setTemporaryProducts(filteredProducts);
  }

  @action
  Future<void> calcularValorPedido(order, matchingProduct) async {
    individualOrderValue =
        double.parse(matchingProduct.valor!) * double.parse(order.quantidade);
    orderValue.add(individualOrderValue);

    if(orderValue.isNotEmpty) {
      totalValueOrder =
        orderValue.reduce((valorAtual, valor) => valorAtual + valor);
    }
  }
}
