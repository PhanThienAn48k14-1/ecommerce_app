

import '../../models/order.dart';

class OrderRepository {
  List<Order> getOrders() {
    return [
      Order(
        orderNumber: '123432',
        itemCount: 1,
        totalAmount: 2938.3,
        status: OrderStatus.active,
        imageUrl: 'assets/images/nike.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Order(
        orderNumber: '123432',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.cancelled,
        imageUrl: 'assets/images/nike.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Order(
        orderNumber: '123432',
        itemCount: 2,
        totalAmount: 2938.3,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/nike.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      Order(
        orderNumber: '123432',
        itemCount: 5,
        totalAmount: 2938.3,
        status: OrderStatus.completed,
        imageUrl: 'assets/images/nike.jpg',
        orderDate: DateTime.now().subtract(const Duration(hours: 7)),
      ),
    ];
  }
  List<Order> getOrdersByStatus(OrderStatus status) {
    return getOrders().where((order) => order.status == status).toList();
  }
}