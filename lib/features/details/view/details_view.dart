import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heyflutter_codding_challenge/core/extensions/context_extension.dart';
import 'package:heyflutter_codding_challenge/features/details/view/zoom_image.dart';
import 'package:heyflutter_codding_challenge/features/home/model/product_model.dart';
import 'package:heyflutter_codding_challenge/product/component/custom_button.dart';
import 'package:latlong2/latlong.dart';
import 'package:readmore/readmore.dart';

class DetailsView extends StatefulWidget {
  final ProductModel productModel;
  const DetailsView({super.key, required this.productModel});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late final ProductModel _productModel;
  @override
  void initState() {
    _productModel = widget.productModel;
    super.initState();
  }

  int imagesLength = 3;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildShowCaseImage(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: context.pagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildRatingBar,
                        nameAndFavButton,
                        description,
                        SizedBox(
                          height: 300,
                          child: FlutterMap(
                            options: const MapOptions(
                              initialZoom: 12,
                              initialCenter: LatLng(36.812103, 34.641479),
                            ),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                userAgentPackageName: 'com.example.app',
                              ),
                              const MarkerLayer(
                                rotate: true,
                                markers: [
                                  Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: LatLng(36.812103, 34.641479),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        spacer,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: context.colors.onPrimary,
              width: context.width,
              padding: context.paddingNormal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "\$ ${_productModel.price.toInt()}",
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    text: "Pay now",
                    onPressed: () {},
                    borderRadius: context.normalRadius,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column get description {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: context.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        ReadMoreText(
          _productModel.description,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Show less',
          moreStyle: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
          lessStyle: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.primary,
          ),
        ),
      ],
    );
  }

  Row get nameAndFavButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _productModel.name,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        ),
      ],
    );
  }

  RatingBar get buildRatingBar {
    return RatingBar.builder(
      initialRating: _productModel.stars,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      ignoreGestures: true,
      itemSize: context.height * .03,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      unratedColor: Colors.amber.withOpacity(0.5),
      onRatingUpdate: (double value) {},
    );
  }

  GestureDetector buildShowCaseImage(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          Navigator.pop(context);
        }
      },
      child: Stack(
        children: [
          Hero(
            tag: _productModel.id,
            child: Image.network(
              _productModel.showCaseImage,
              fit: BoxFit.cover,
              height: context.height * .5,
              width: context.width,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(.6),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: context.height * .07,
            left: context.width * .05,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.onPrimary,
                  shape: BoxShape.circle,
                ),
                padding: context.paddingLow,
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: SizedBox(
              height: context.height * .4,
              width: context.height * .1,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imagesLength,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: buildClipRRect(context, index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect buildClipRRect(BuildContext context, int index) {
    return ClipRRect(
      borderRadius: context.containerRadius,
      child: index == (imagesLength - 1)
          ? Stack(
              children: [
                buildImage(index, context),
                Positioned.fill(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ZoomImage(productModel: _productModel),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Text(
                          "+${_productModel.images.length - index}",
                          style: context.textTheme.titleLarge?.copyWith(
                            color: context.colors.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : buildImage(index, context),
    );
  }

  Image buildImage(int index, BuildContext context) {
    return Image.network(
      _productModel.images[index],
      fit: BoxFit.cover,
      width: context.width * .2,
      height: context.width * .2,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: context.width * .2,
          height: context.width * .2,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  SizedBox get spacer => SizedBox(height: context.height * .2);
}
