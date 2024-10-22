import 'package:faker_dart/faker_dart.dart';

import 'customer_details.dart';
import 'interfaces/icustomer_details_service.dart';

class CustomerDetailsService implements ICustomerDetailsService {

  static final faker = Faker.instance;

  const CustomerDetailsService();

  @override
  Future<CustomerDetails> getCustomerDetails(String id) => Future.delayed(
    const Duration(seconds: 2),
    () => CustomerDetails(
      customerId: id,
      email     : faker.internet.email(),
      hobby     : faker.animal.bird(),
      position  : faker.company.companyName(),
    ),
  );

}