library objectory_service;
import 'package:objectory/objectory_browser.dart';
import 'domain_model.dart';

const DefaultUri = '127.0.0.1:8080';



class ObjectoryService {
  String _recipesUrl = 'recipes.json';
  String _categoriesUrl = 'categories.json';

  Future _loaded;

  Map<String, Recipe> _recipesCache = new Map<String, Recipe>();
  List<String> _categoriesCache;

  ObjectoryService() {
    _loaded = Future.wait([_loadRecipes()]);
  }
 
  Future _loadRecipes() {
    objectory = new ObjectoryWebsocketBrowserImpl(DefaultUri,registerClasses,false);
    return objectory.initDomainModel().then((_) {
      return objectory[Categories].findOne();
    }).then((Categories categories) {        
      _categoriesCache = categories.list;
      return objectory[Recipe].find().then((recipes) {
        for (Recipe recipe in recipes) {
          _recipesCache[recipe.key] = recipe;
        }
        return new Future.value(true);
      });
    });
  }


  Future<Recipe> getRecipeById(String id) {
    if (_recipesCache == null) {
      return _loaded.then((_) {
        return _recipesCache[id];
      });
    }
    return new Future.value(_recipesCache[id]);
  }

  Future<Map<String, Recipe>> getAllRecipes() {
    if (_recipesCache == null) {
      return _loaded.then((_) {
        return _recipesCache;
      });
    }
    return new Future.value(_recipesCache);
  }

  Future<List<String>> getAllCategories() {
    if (_categoriesCache == null) {
      return _loaded.then((_) {
        return _categoriesCache;
      });
    }
    return new Future.value(_categoriesCache);
  }
}
