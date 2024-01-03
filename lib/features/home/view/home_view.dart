import 'package:flutter/material.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';
import 'package:heyflutter_codding_challenge/features/details/view/details_view.dart';
import 'package:heyflutter_codding_challenge/features/home/helper/bottom_bar_item.dart';
import 'package:heyflutter_codding_challenge/features/home/helper/fill_product.dart';
import 'package:heyflutter_codding_challenge/features/home/model/product_model.dart';
import 'package:heyflutter_codding_challenge/product/component/custom_text_field.dart';
import 'package:heyflutter_codding_challenge/product/enums/assets_enum.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController _searchController;
  late final List<ProductModel> listProduct;
  @override
  void initState() {
    _searchController = TextEditingController();
    listProduct = FillProduct.list;
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AssetsEnum.logo.toPng),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
              spacer,
              CustomTextField(
                controller: _searchController,
                hintText: "Search Here...",
                suffixIcon: Icons.search,
              ),
              spacer,
              Expanded(
                child: ListView(
                  children: [
                    buildFirstImage,
                    spacer,
                    buildImage(listProduct[0]),
                    spacer,
                    buildPopularText,
                    spacer,
                    buildImage(listProduct[1]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar,
    );
  }

  Row get buildPopularText {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Popular Today",
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Other",
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: context.colors.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox get spacer => SizedBox(height: context.height * .03);

  InkWell buildImage(ProductModel productModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(
              productModel: productModel,
            ),
          ),
        );
      },
      child: Hero(
        tag: productModel.id,
        child: ClipRRect(
          borderRadius: context.containerRadius,
          child: Stack(
            children: [
              SizedBox(
                width: context.width,
                height: context.height * .25,
                child: Image.network(
                  productModel.showCaseImage,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: context.filter,
                    child: Container(
                      height: context.height * .1,
                      color: Colors.black.withOpacity(0.2),
                      padding: context.paddingNormal,
                      child: Column(
                        children: [
                          Expanded(child: buildNameAndStar(productModel)),
                          Expanded(child: buildPriceAndFeature(productModel)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildPriceAndFeature(ProductModel productModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$ ${productModel.price.ceil()}/mo",
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade200,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          productModel.roomLength,
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade200,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Row buildNameAndStar(ProductModel productModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productModel.name,
          style: context.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          width: 50,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: context.normalRadius,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 4,
                child: Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                  size: 12,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  productModel.stars.toString(),
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ClipRRect get buildFirstImage {
    return ClipRRect(
      borderRadius: context.containerRadius,
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height * .15,
            child: Image.asset(
              AssetsEnum.houseOne.toJpg,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: context.width,
            height: context.height * .15,
            color: Colors.black.withOpacity(.4),
            child: Padding(
              padding: context.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: context.width * .5,
                      child: Text(
                        "Let's buy a house here",
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Diskon 10%',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '12 October 2022',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar get buildBottomNavigationBar {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: BottomBarItem.item,
    );
  }
}
