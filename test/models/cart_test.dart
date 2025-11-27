import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    test('starts empty', () {
      final cart = Cart();
      expect(cart.isEmpty, true);
      expect(cart.isNotEmpty, false);
      expect(cart.itemCount, 0);
    });

    group('addSandwich', () {
      test('adds sandwich to cart', () {
        final cart = Cart();
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );

        cart.addSandwich(sandwich);

        expect(cart.itemCount, 1);
        expect(cart.isEmpty, false);
        expect(cart.isNotEmpty, true);
        expect(cart.items.first, sandwich);
      });

      test('adds multiple sandwiches to cart', () {
        final cart = Cart();
        final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sandwich2 = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich1);
        cart.addSandwich(sandwich2);

        expect(cart.itemCount, 2);
        expect(cart.items[0], sandwich1);
        expect(cart.items[1], sandwich2);
      });
    });

    group('removeSandwich', () {
      test('removes sandwich at valid index', () {
        final cart = Cart();
        final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sandwich2 = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich1);
        cart.addSandwich(sandwich2);

        final result = cart.removeSandwich(0);

        expect(result, true);
        expect(cart.itemCount, 1);
        expect(cart.items.first, sandwich2);
      });

      test('returns false for invalid index', () {
        final cart = Cart();
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );

        cart.addSandwich(sandwich);

        expect(cart.removeSandwich(-1), false);
        expect(cart.removeSandwich(5), false);
        expect(cart.itemCount, 1);
      });
    });

    group('removeSandwichByValue', () {
      test('removes first occurrence of sandwich', () {
        final cart = Cart();
        final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sandwich2 = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich1);
        cart.addSandwich(sandwich2);

        final result = cart.removeSandwichByValue(sandwich1);

        expect(result, true);
        expect(cart.itemCount, 1);
        expect(cart.items.first, sandwich2);
      });

      test('returns false when sandwich not found', () {
        final cart = Cart();
        final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sandwich2 = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich1);

        final result = cart.removeSandwichByValue(sandwich2);

        expect(result, false);
        expect(cart.itemCount, 1);
      });
    });

    group('clear', () {
      test('removes all items from cart', () {
        final cart = Cart();
        final sandwich1 = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sandwich2 = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich1);
        cart.addSandwich(sandwich2);
        cart.clear();

        expect(cart.isEmpty, true);
        expect(cart.itemCount, 0);
      });
    });

    group('calculateTotalPrice', () {
      test('returns 0 for empty cart', () {
        final cart = Cart();
        expect(cart.calculateTotalPrice(), 0);
      });

      test('calculates price for single footlong sandwich', () {
        final cart = Cart();
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );

        cart.addSandwich(sandwich);

        expect(cart.calculateTotalPrice(), 11);
      });

      test('calculates price for single six-inch sandwich', () {
        final cart = Cart();
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(sandwich);

        expect(cart.calculateTotalPrice(), 7);
      });

      test('calculates price for multiple sandwiches', () {
        final cart = Cart();
        final footlong = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        final sixInch = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );

        cart.addSandwich(footlong); // 11
        cart.addSandwich(footlong); // 11
        cart.addSandwich(sixInch);  // 7

        expect(cart.calculateTotalPrice(), 29); // 11 + 11 + 7
      });
    });

    group('displayCart', () {
      test('returns empty list for empty cart', () {
        final cart = Cart();
        expect(cart.displayCart(), []);
      });

      test('returns formatted description for single sandwich', () {
        final cart = Cart();
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );

        cart.addSandwich(sandwich);

        final display = cart.displayCart();
        expect(display.length, 1);
        expect(display[0], 'Footlong Veggie Delight on white bread');
      });

      test('returns formatted descriptions for multiple sandwiches', () {
        final cart = Cart();
        final footlong = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        );
        final sixInch = Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: false,
          breadType: BreadType.wholemeal,
        );

        cart.addSandwich(footlong);
        cart.addSandwich(sixInch);

        final display = cart.displayCart();
        expect(display.length, 2);
        expect(display[0], 'Footlong Chicken Teriyaki on wheat bread');
        expect(display[1], 'Six-inch Meatball Marinara on wholemeal bread');
      });
    });

    test('items getter returns unmodifiable list', () {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addSandwich(sandwich);
      final items = cart.items;

      expect(() => items.add(sandwich), throwsUnsupportedError);
    });
  });
}
