import 'package:heyflutter_codding_challenge/features/home/model/product_model.dart';

class FillProduct {
  static List<ProductModel> list = [
    ProductModel(
      id: 1,
      name: "123 Junilun Zahra",
      price: 123,
      stars: 4.5,
      roomLength: "1 Room meet",
      showCaseImage: "https://source.unsplash.com/random/?house,building,home",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
      images: [
        "https://source.unsplash.com/random/7/?house,building,home",
        "https://source.unsplash.com/random/8/?house,building,home",
        "https://source.unsplash.com/random/9/?house,building,home",
        "https://source.unsplash.com/random/10/?house,building,home",
        "https://source.unsplash.com/random/11/?house,building,home",
        "https://source.unsplash.com/random/12/?house,building,home",
      ],
    ),
    ProductModel(
      id: 2,
      name: "123 Jolte Zahro",
      price: 121,
      stars: 3,
      roomLength: "2 Room meet",
      showCaseImage:
          "https://source.unsplash.com/random/?house,building,home/2",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500",
      images: [
        "https://source.unsplash.com/random/1/?house,building,home",
        "https://source.unsplash.com/random/2/?house,building,home",
        "https://source.unsplash.com/random/3/?house,building,home",
        "https://source.unsplash.com/random/4/?house,building,home",
        "https://source.unsplash.com/random/5/?house,building,home",
        "https://source.unsplash.com/random/6/?house,building,home",
      ],
    ),
  ];
}
