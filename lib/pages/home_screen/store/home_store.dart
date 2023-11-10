import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:partylink/model/product_model.dart';

import '../../../model/category_model.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ObservableList<Category> categoryList = ObservableList<Category>();

  ObservableList<Product> productList = ObservableList<Product>();
  ObservableList<Product> productListAux = ObservableList<Product>();

  @observable
  bool loading = false;

  @observable
  int currentIndex = 0;

  @observable
  Category? selectedCategory;

  @observable
  TextEditingController searchController = TextEditingController();

  @action
  void addCategoryList(value) {
    categoryList.clear();

    final parsed = json.decode(value);

    if (parsed != null) {
      for (var i = 0; i < parsed['data'].length; i++) {
        try {
          Category category = Category.fromJson(parsed['data'][i]);
          print('${parsed['data'][i]}');

          categoryList.add(category);
        } catch (e) {
          log('ERRO AO ADICIONAR CATEGORIA >>> $e');
        }
      }
    }
  }

  @action
  void addProductList(value) {
    productList.clear();
    productListAux.clear();

    final parsed = json.decode(value);

    if (parsed != null) {
      for (var i = 0; i < parsed['data'].length; i++) {
        try {
          Product product = Product.fromJson(parsed['data'][i]);
          print('${parsed['data'][i]}');

          productList.add(product);
        } catch (e) {
          log('ERRO AO ADICIONAR PRODUTO >>> $e');
        }
      }
      productListAux.addAll(productList);
    }
  }

  @action
  setSelectedCategory(Category category) => selectedCategory = category;

  @action
  toggleSelectedCategory(Category category) {
    if (selectedCategory == category) {
      selectedCategory = null;
    } else {
      selectedCategory = category;
    }
  }

  @action
  setLoading(value) => loading = value;

  @action
  onTapeChange(index) => currentIndex = index;
}
