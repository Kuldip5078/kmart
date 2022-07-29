class Product {
  final int? id;
  final String? name;
  final int? price;
  int? qty;

  Product({this.id, this.name, this.price, this.qty = 1});
}

void main() {
  Product p = Product(id: 1, name: "Chai Patti", price: 350);
  // Product(id: 2, name: "Chiini", price: 52);
  // Product(id: 3, name: "Chaval", price: 65);
  // Product(id: 4, name: "Shing Tel", price: 2450);
  // Product(id: 5, name: "Goverdhan Ghee", price: 620);
  // Product(id: 6, name: "Turdal", price: 70);
  // Product(id: 7, name: "Methi", price: 45);
  // Product(id: 8, name: "Chana", price: 55);
}
