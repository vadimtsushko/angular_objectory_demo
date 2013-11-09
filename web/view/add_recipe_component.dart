part of recipe_book;

@NgComponent(
    selector: 'add-recipe',
    templateUrl: 'view/add_recipe_component.html',
    cssUrl: 'view/add_recipe_component.css',
    publishAs: 'ctrl',
    map: const {
      'recipe-map':'<=>recipeMap',
      'categories':'<=>categories'
    }
)
class AddRecipeComponent {
  Route _route;
  Map<String, Recipe> recipeMap;
  List<String> categories;
  Recipe _recipe;
  AddRecipeComponent() {
    _recipe = new Recipe()..rating = 0;
  }
  get recipe {
    return _recipe;
  }

  EditRecipeComponent(RouteProvider routeProvider) {
    _route = routeProvider.route;
  }

  void save() {
    recipe.save().then((_) {
      recipeMap[recipe.key] = recipe;
    });
  }
  
  void cancel() {    
  }

}