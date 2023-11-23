class Item {
  final String _name;
  final double _price;
  final String _image;

  Item(this._name, this._price, this._image);

  String get name => _name;
  double get price => _price;
  String get image => _image;


  @override
  String toString(){
    String space = '';
    for(int i=0;i<3 - _price.toString().length;i++){
      space += ' ';
    }
    return 'Price: \$$_price $space$_name';
  }

}

List<Item> items = [
  Item('iPhone 15 Pro', 999,'images/iPhone-15.jpg'),
  Item('Samsung Galaxy S23 Ultra',899,'images/Samsung-Galaxy-S23-Ultra_review_2.jpg'),
  Item('Google Pixel 7a',374,'images/Google-Pixel-7a.webp'),
  Item('OnePlus 11',699, 'OnePlus-11.jpg'),
];