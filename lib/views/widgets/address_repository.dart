import '../../models/address.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return const [
      Address(
        id: '1',
        label: 'Office',
        fullAddress: '123 Nam Son',
        city: 'Da Nang',
        state: 'DN',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.office,
      ),
      Address(
        id: '2',
        label: 'Home',
        fullAddress: '123 Nui Thanh',
        city: 'Ha Noi',
        state: 'HN',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '3',
        label: 'Home',
        fullAddress: '123 Phan Dang luu',
        city: 'Ho Chi Minh',
        state: 'HCM',
        zipCode: '10001',
        isDefault: true,
        type: AddressType.home,
      ),
    ];
  }
  Address? getDefaultAddress() {
    return getAddresses().firstWhere(
          (address) => address.isDefault,
      orElse: () => getAddresses().first,
    );
  }
}