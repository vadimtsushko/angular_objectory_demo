library add_recipe_component;

import '../service/domain_model.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'add-recipe',
    templateUrl: 'packages/angular_dart_demo/component/add_recipe_component.html',
    cssUrl: 'packages/angular_dart_demo/component/add_recipe_component.css',
    publishAs: 'cmp'
)
class AddRecipeComponent {
  @NgOneWay('recipe-map')
  Map<String, Recipe> recipeMap;
  @NgOneWay('categories')
  List<String> categories;  
  @NgOneWay('all-recipes')
  List<Recipe> allRecipes;
  
  Recipe _recipe;

  Recipe get recipe => _recipe;
  RouteProvider _routeProvider;
  AddRecipeComponent(this._routeProvider) {
    _recipe = new Recipe()..rating = 0;
    _routeProvider.route.onEnter.listen(onEnter);
  }
  void onEnter(RouteEnterEvent event) {
    print('in OnEnter');
    _recipe = new Recipe()..rating = 0;
  }
  void save() {
    recipe.save().then((_) {
      recipeMap[recipe.recipeId] = recipe;
      allRecipes.add(recipe);
      _recipe = new Recipe()..rating = 0;
    });
  }
  void cancel() { 
  }

}