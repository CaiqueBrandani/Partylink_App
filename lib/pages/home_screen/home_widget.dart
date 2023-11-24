import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:partylink/globals/globals_var.dart';
import 'package:partylink/pages/home_screen/store/home_store.dart';
import 'package:provider/provider.dart';

import '../../globals/theme_controller.dart';

class HomeWidget {
  BuildContext context;
  HomeWidget(this.context);

  Widget homeWidgetPrincipal(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(height: 30),
          _appBar(context),
          const SizedBox(height: 40),
          _searchField(context),
          const SizedBox(height: 40),
          _categoryList(context),
          const SizedBox(height: 30),
          _productList(context),
        ],
      ),
    );
  }

  Widget _appBar(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.barsStaggered,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: globalsThemeVar.themeColors.blackTextColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _searchField(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final homeStore = Provider.of<HomeStore>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
      child: Column(
        children: [
          Text(
            'Produtos e Serviços de Qualidade',
            style: TextStyle(
              fontFamily: 'Monteserrat',
              fontSize: GlobalsSizes().bigSize * 0.95,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              color: globalsThemeVar.themeColors.secondaryColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(GlobalsSizes().borderSize)),
              boxShadow: [
                BoxShadow(
                  color: globalsThemeVar.themeColors.shadedColor,
                  blurRadius: 10.0,
                  spreadRadius: 0.2,
                  offset: const Offset(
                    1.0,
                    2.0,
                  ),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  cursorColor: globalsThemeVar.themeColors.primaryColor,
                  style: TextStyle(
                      color: globalsThemeVar.themeColors.blackTextColor),
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                        color: globalsThemeVar.themeColors.blackTextColor,
                        size: 15),
                    border: InputBorder.none,
                    hintText: "Buscar",
                    hintStyle: TextStyle(
                      color: globalsThemeVar.themeColors.grayTextColor,
                      fontSize: GlobalsSizes().smallSize,
                    ),
                  ),
                  onChanged: (newValue) {},
                  controller: homeStore.searchController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryList(context) {
    final homeStore = Provider.of<HomeStore>(context, listen: true);

    return Observer(
      builder: (_) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 25,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: homeStore.categoryList.length,
            itemBuilder: (_, index) {
              if (homeStore.categoryList[index] ==
                  homeStore.categoryList.first) {
                return Container(
                  margin: EdgeInsets.only(
                      left: GlobalsSizes().marginSize, right: 13),
                  child: _categoryCard(context, homeStore.categoryList[index]),
                );
              } else if (homeStore.categoryList[index] ==
                  homeStore.categoryList.last) {
                return Container(
                  margin: EdgeInsets.only(
                      left: 13, right: GlobalsSizes().marginSize),
                  child: _categoryCard(context, homeStore.categoryList[index]),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 13),
                  child: _categoryCard(context, homeStore.categoryList[index]),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _categoryCard(context, category) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final homeStoreT = Provider.of<HomeStore>(context, listen: true);

    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            homeStoreT.toggleSelectedCategory(category);
          },
          child: Container(
            decoration: homeStoreT.selectedCategory == category
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 2.0,
                          color: globalsThemeVar.themeColors.primaryColor),
                    ),
                  )
                : const BoxDecoration(),
            child: Center(
              child: Text(
                '${category.descricao}',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                    color: homeStoreT.selectedCategory == category
                        ? globalsThemeVar.themeColors.primaryColor
                        : globalsThemeVar.themeColors.grayTextColor),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _productList(context) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);
    final homeStore = Provider.of<HomeStore>(context, listen: true);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'veja mais',
                  style: TextStyle(
                    color: globalsThemeVar.themeColors.primaryColor,
                    fontFamily: 'Montserrat',
                    fontSize: GlobalsSizes().smallSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          child: Observer(builder: (_) {
            if (homeStore.filteredProductList.isEmpty) {
              return Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: GlobalsSizes().marginSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off_outlined,
                        size: 100,
                        color: globalsThemeVar.themeColors.grayTextColor,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Nenhum produto disponível para a categoria selecionada.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: globalsThemeVar.themeColors.grayTextColor,
                          fontSize: GlobalsSizes().smallSize,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: homeStore.filteredProductList.length,
                itemBuilder: (_, index) {
                  if (homeStore.filteredProductList[index] ==
                      homeStore.filteredProductList.first) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 50, right: 13, top: 13, bottom: 13),
                      child: _productCard(
                        context,
                        homeStore.filteredProductList[index],
                      ),
                    );
                  } else if (homeStore.filteredProductList[index] ==
                      homeStore.filteredProductList.last) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 13, right: 50, top: 13, bottom: 13),
                      child: _productCard(
                        context,
                        homeStore.filteredProductList[index],
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 13, right: 13, top: 13, bottom: 13),
                      child: _productCard(
                        context,
                        homeStore.filteredProductList[index],
                      ),
                    );
                  }
                },
              );
            }
          }),
        )
      ],
    );
  }

  Widget _productCard(constext, product) {
    final globalsThemeVar = Provider.of<GlobalsThemeVar>(context);

    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: 170,
            height: 220,
            decoration: BoxDecoration(
              color: globalsThemeVar.themeColors.secondaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(GlobalsSizes().borderSize),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 80, bottom: 15),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.nome,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: globalsThemeVar.themeColors.blackTextColor,
                      fontSize: GlobalsSizes().mediumSize,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'R\$ ${product.valor} / ${product.medida?.descricao ?? ""}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: globalsThemeVar.themeColors.primaryColor,
                      fontSize: GlobalsSizes().smallSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 134,
            width: 134,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: globalsThemeVar.themeColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
