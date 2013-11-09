library domain_model;
import 'package:objectory/objectory.dart';
import 'dart:async';
const DefaultUri = '127.0.0.1:8080';

class Recipe extends PersistentObject  {
    
  String get name => getProperty('name');
  set name(String value) => setProperty('name',value);

  String get imgUrl => getProperty('imgUrl');
  set imgUrl(String value) => setProperty('imgUrl',value);

  String get category => getProperty('category');
  set category(String value) => setProperty('category',value);

  //List<Ingredient> get ingredients => getPersistentList(Ingredient,'ingredients');

  List<String> get ingredients => getProperty('ingredients');
  set ingredients (List<String> value) => setProperty('ingredients', value);
  
  int get rating => getProperty('rating');
  set rating(int value) { 
    setProperty('rating',value);
    // Autosave rating changes in already persistent objects
    if (id != null) {
      save();
    }
  }

  String get directions => getProperty('directions');
  set directions(String value) => setProperty('directions',value);

  String get key => id.toHexString();
}

class Ingredient extends EmbeddedPersistentObject  {
  
  String get name => getProperty('name');
  set name(String value) => setProperty('name',value);

  int get qty => getProperty('qty');
  set qty(int value) => setProperty('qty',value);

}

class Categories extends PersistentObject {
  List<String> get list => getProperty('list');
  set list (List<String> value) => setProperty('list', value); 
}

void registerClasses() {
  objectory.registerClass(Recipe,()=>new Recipe(),()=>new List<Recipe>());
  objectory.registerClass(Ingredient,()=>new Ingredient(),()=>new List<Ingredient>());
  objectory.registerClass(Categories,()=>new Categories());
}
