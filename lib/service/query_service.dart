library objectory_service;
import 'package:objectory/objectory_browser.dart';
import 'domain_model.dart';
import 'package:angular/angular.dart';

const DefaultUri = '127.0.0.1:8881';

@Injectable()
class QueryService {

  Future _loaded;

  Map<String, Recipe> _recipesCache;
  List<String> _categoriesCache;


  QueryService() {
    _loaded = _loadData();
  }

  Future _loadData() {
    objectory = new ObjectoryWebsocketBrowserImpl(DefaultUri,registerClasses,false);
    return objectory.initDomainModel().then((_) {
      return objectory[Categories].findOne();
    }).then((Categories categories) {        
      _categoriesCache = categories.list.toList();
      return objectory[Recipe].find().then((recipes) {
        _recipesCache = new Map<String, Recipe>();
        for (Recipe recipe in recipes) {
          _recipesCache[recipe.recipeId] = recipe;
        }
        return new Future.value(true);
      });
    });
  }


  Future<Recipe> getRecipeById(String id) {
    return _recipesCache == null
        ? _loaded.then((_) => _recipesCache[id])
        : new Future.value(_recipesCache[id]);
  }

  Future<Map<String, Recipe>> getAllRecipes() {
    return _recipesCache == null
        ? _loaded.then((_) => _recipesCache)
        : new Future.value(_recipesCache);
  }

  Future<List<String>> getAllCategories() {
    return _categoriesCache == null
        ? _loaded.then((_) => _categoriesCache)
        : new Future.value(_categoriesCache);
  }
}
