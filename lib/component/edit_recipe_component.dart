library edit_recipe_component;

import '../service/domain_model.dart';
import 'package:angular/angular.dart';

@Component(
    selector: 'edit-recipe',
    templateUrl: 'packages/angular_dart_demo/component/edit_recipe_component.html',
    cssUrl: 'packages/angular_dart_demo/component/edit_recipe_component.css',
    publishAs: 'cmp'
)
class EditRecipeComponent {
  @NgOneWay('recipe-map')
  Map<String, Recipe> recipeMap;
  @NgOneWay('categories')
  List<String> categories;  
  
  String _recipeId;

  Recipe get recipe => recipeMap == null ? null : recipeMap[_recipeId];

  EditRecipeComponent(RouteProvider routeProvider) {
    _recipeId = routeProvider.parameters['recipeId'];
  }
  
  void save() {
    recipe.save();
  }
  void cancel() {
    recipe.reRead();    
  }

}