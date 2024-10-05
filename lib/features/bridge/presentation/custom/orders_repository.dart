
import 'order.dart';
import 'istorage.dart';
import 'entity_base.dart';
import 'irepository.dart';

class OrdersRepository implements IRepository {

  final IStorage storage;

  const OrdersRepository(this.storage);

  @override
  List<EntityBase> getAll() => storage.fetchAll<Order>();

  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase as Order);
  }
  
}
