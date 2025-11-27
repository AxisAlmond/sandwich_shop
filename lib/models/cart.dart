import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class Cart {
  final List<Sandwich> _items = [];
  final PricingRepository _pricingRepository = PricingRepository();

  /// Returns a copy of the items in the cart
  List<Sandwich> get items => List.unmodifiable(_items);

  /// Returns the number of items in the cart
  int get itemCount => _items.length;

  /// Adds a sandwich to the cart
  void addSandwich(Sandwich sandwich) {
    _items.add(sandwich);
  }

  /// Removes a sandwich from the cart at the specified index
  /// Returns true if successful, false if index is invalid
  bool removeSandwich(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      return true;
    }
    return false;
  }

  /// Removes the first occurrence of the specified sandwich
  /// Returns true if successful, false if sandwich not found
  bool removeSandwichByValue(Sandwich sandwich) {
    return _items.remove(sandwich);
  }

  /// Clears all items from the cart
  void clear() {
    _items.clear();
  }

  /// Calculates the total price of all sandwiches in the cart
  int calculateTotalPrice() {
    int total = 0;
    for (var sandwich in _items) {
      total += _pricingRepository.calculate(1, sandwich.isFootlong);
    }
    return total;
  }

  /// Returns a list of sandwich descriptions in the cart
  List<String> displayCart() {
    return _items.map((sandwich) {
      String size = sandwich.isFootlong ? 'Footlong' : 'Six-inch';
      return '$size ${sandwich.name} on ${sandwich.breadType.name} bread';
    }).toList();
  }

  /// Returns true if the cart is empty
  bool get isEmpty => _items.isEmpty;

  /// Returns true if the cart has items
  bool get isNotEmpty => _items.isNotEmpty;
}
