part of recipe_book;

@NgComponent(
    selector: 'edit-recipe',
    templateUrl: 'view/edit_recipe_component.html',
    cssUrl: 'view/edit_recipe_component.css',
    publishAs: 'ctrl',
    map: const {
      'recipe-map':'<=>recipeMap',
      'categories':'<=>categories'
    }
)
class EditRecipeComponent {
  Route _route;
  Map<String, Recipe> recipeMap;
  List<String> categories;
  Recipe _recipe;

  get recipe {
    return recipeMap[_route.parameters['recipeId']];
  }

  EditRecipeComponent(RouteProvider routeProvider) {
    _route = routeProvider.route;
  }
  
  void save() {
    recipe.save();
  }
  void cancel() {
    recipe.reRead();    
  }

}