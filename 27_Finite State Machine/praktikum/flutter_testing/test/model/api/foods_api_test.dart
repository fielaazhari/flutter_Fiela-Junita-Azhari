import 'package:flutter_testing/models/foods.dart';
import 'package:flutter_testing/service/services.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'foods_api_test.mocks.dart';

@GenerateMocks([FoodService])
void main() {
  FoodService foodService = MockFoodService();
  group(
    'Foods Service',
    () {
      test(
        'get all foods return data',
        () async {
          when(foodService.fetchFood()).thenAnswer(
            (_) async => <Foods>[
              Foods(id: 1, name: 'a'),
            ],
          );

          var foods = await FoodService().fetchFood();
          expect(foods!.isNotEmpty, true);
        },
      );
    },
  );
}
