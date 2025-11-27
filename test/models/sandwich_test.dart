import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('constructor sets properties correctly', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wheat,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, true);
      expect(sandwich.breadType, BreadType.wheat);
    });

    group('name getter', () {
      test('returns correct name for Veggie Delight', () {
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        expect(sandwich.name, 'Veggie Delight');
      });

      test('returns correct name for Chicken Teriyaki', () {
        final sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wheat,
        );
        expect(sandwich.name, 'Chicken Teriyaki');
      });

      test('returns correct name for Tuna Melt', () {
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: true,
          breadType: BreadType.wholemeal,
        );
        expect(sandwich.name, 'Tuna Melt');
      });

      test('returns correct name for Meatball Marinara', () {
        final sandwich = Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: false,
          breadType: BreadType.white,
        );
        expect(sandwich.name, 'Meatball Marinara');
      });
    });

    group('image getter', () {
      test('returns correct image path for footlong Veggie Delight', () {
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
      });

      test('returns correct image path for six-inch Chicken Teriyaki', () {
        final sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: false,
          breadType: BreadType.wheat,
        );
        expect(sandwich.image, 'assets/images/chickenTeriyaki_six_inch.png');
      });

      test('returns correct image path for footlong Tuna Melt', () {
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: true,
          breadType: BreadType.wholemeal,
        );
        expect(sandwich.image, 'assets/images/tunaMelt_footlong.png');
      });

      test('returns correct image path for six-inch Meatball Marinara', () {
        final sandwich = Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: false,
          breadType: BreadType.white,
        );
        expect(sandwich.image, 'assets/images/meatballMarinara_six_inch.png');
      });
    });

    group('bread type variations', () {
      test('creates sandwich with white bread', () {
        final sandwich = Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        );
        expect(sandwich.breadType, BreadType.white);
      });

      test('creates sandwich with wheat bread', () {
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wheat,
        );
        expect(sandwich.breadType, BreadType.wheat);
      });

      test('creates sandwich with wholemeal bread', () {
        final sandwich = Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wholemeal,
        );
        expect(sandwich.breadType, BreadType.wholemeal);
      });
    });
  });
}
