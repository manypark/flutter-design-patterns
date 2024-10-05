
import 'customer.dart';
import 'entity_base.dart';
import 'irepository.dart';
import 'istorage.dart';

class CustomersRepository implements IRepository {

  final IStorage storage;

  const CustomersRepository(this.storage);

  @override
  List<EntityBase> getAll() => storage.fetchAll<Customer>();

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }
}