class CarouselModel {
  final String? image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/png01.png"},
  {"image": "assets/images/png02.png"},
  {"image": "assets/images/png03.png"},
  {"image": "assets/images/png04.png"},
];
