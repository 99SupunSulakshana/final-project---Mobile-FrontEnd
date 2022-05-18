// ignore_for_file: file_names

class PopularModel {
  String name;
  String country;
  String image;

  PopularModel(this.name, this.country, this.image);
}

List<PopularModel> populars = popularsData
    .map(
        (item) => PopularModel(item['name']!, item['country']!, item['image']!))
    .toList();

var popularsData = [
  {
    "name": "What's App Package",
    "country": "Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"
  },
  {
    "name": "What's App Package",
    "country": "Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80"
  },
  {
    "name": "What's App Package",
    "country": "Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80"
  },
  {
    "name": "What's App Package",
    "country": "Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"
  },
  {
    "name": "What's App Package",
    "country": "Sri Lanka",
    "image":
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"
  }
];
