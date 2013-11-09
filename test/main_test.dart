library main_test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import '../web/service/domain_model.dart';
import '../web/service/objectory_service.dart';

import 'package:angular_objectory_demo/rating/rating_component.dart';


import '../web/main.dart';

main() {
  setUp(() {
   setUpInjector();
   module((Module m) => m.install(new MyAppModule()));
  });
  tearDown(tearDownInjector);

  group('recipe-book', () {
    test('should load recipes', async(inject((Injector injector,
                                              MockHttpBackend backend) {
      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipesController = injector.get(RecipeBookController);
      expect(recipesController.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      expect(recipesController.allRecipes, isNot(isEmpty));
    })));

    test('should select recipe', async(inject((Injector injector,
                                               MockHttpBackend backend) {
      backend.expectGET('recipes.json').respond('[{"name": "test1"}]');
      backend.expectGET('categories.json').respond('["c1"]');

      var recipesController = injector.get(RecipeBookController);
      expect(recipesController.allRecipes, isEmpty);

      microLeap();
      backend.flush();
      microLeap();

      var recipe = recipesController.allRecipes[0];
      recipesController.selectRecipe(recipe);
      expect(recipesController.selectedRecipe, same(recipe));
    })));
  });

  group('rating component', () {
    test('should show the right number of stars',
        inject((RatingComponent rating) {
      rating.maxRating = '5';
      expect(rating.stars, equals([1, 2, 3, 4, 5]));
    }));

    test('should handle click', inject((RatingComponent rating) {
      rating.maxRating = '5';
      rating.handleClick(3);
      expect(rating.rating, equals(3));

      rating.handleClick(1);
      expect(rating.rating, equals(1));

      rating.handleClick(1);
      expect(rating.rating, equals(0));

      rating.handleClick(1);
      expect(rating.rating, equals(1));
    }));
  });

  group('categoryFilter', () {
    test('should return subset', inject((CategoryFilter filter) {
      var r1 = new Recipe()..category = 'C1';
      var r2 = new Recipe()..category = 'C2';
      var list = [r1, r2];
      var map = {"C1": false, "C2": true};
      expect(filter(list, map), equals([r2]));
    }));
  });
}
