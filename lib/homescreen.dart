import 'package:flutter/material.dart';
import 'package:kmart/cartscreen.dart';
import 'package:kmart/modelpage.dart';

class Cart_List extends StatefulWidget {
  const Cart_List({Key? key}) : super(key: key);
  @override
  State<Cart_List> createState() => _Cart_ListState();
}

class _Cart_ListState extends State<Cart_List> {
  num total = 0;
  num i = 0;

  List<Product> products = [
    Product(id: 1, name: "Chai Patti", price: 350),
    Product(id: 2, name: "Chiini", price: 52),
    Product(id: 3, name: "Chaval", price: 65),
    Product(id: 4, name: "Shing Tel", price: 2450),
    Product(id: 5, name: "Goverdhan Ghee", price: 620),
    Product(id: 6, name: "Turdal", price: 70),
    Product(id: 7, name: "Methi", price: 45),
    Product(id: 8, name: "Chana", price: 55),
  ];
  List ima = [
    "assets/chai.jpg",
    "assets/chini.jpg",
    "assets/chaval.jpg",
    "assets/tel.jpg",
    "assets/ghee.jpg",
    "assets/turdal.jpg",
    "assets/methi.jpg",
    "assets/chana.jpg",
  ];
  List<Product> cart = [];
  @override
  // void initState() {
  //   cart.length=;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: Row(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  
                  "https://image.shutterstock.com/image-photo/mountville-pa-december-30-2016-260nw-549217498.jpg",
                ),
                radius: 16,
              ),
            ),
            // Icon(Icons.local_grocery_store_sharp),
          ],
        ),
        title: Row(
          children: const [
            //Icon(Icons.local_grocery_store),
            Text("K MART"),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartList(items: cart),
                        ),
                      );
                    },
                    icon: const Icon(Icons.local_grocery_store),
                    label: const Text("cart"),
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  Positioned(
                      top: -8,
                      right: -8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text("${cart.length}"),
                      )),
                ]),
              )),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => item(products[index], ima[index]),
      ),
    );
  }

  item(Product product, im) {
    return Card(
      shadowColor: const Color.fromARGB(255, 240, 17, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          child: ListTile(
              title: Text(product.name!),
              subtitle: Text('₹ ${product.price}/-'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (cart.any((element) => element.id == product.id)) {
                            int changeIndex = cart.indexWhere(
                                (element) => element.id == product.id);
                            cart[changeIndex].qty = cart[changeIndex].qty! + 1;
                          } else {
                            setState(() {
                              cart.add(product);
                            });
                          }
                          print(cart);
                          total = 0;
                          for (var element in cart) {
                            setState(() {
                              total = total + element.qty! * element.price!;
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.currency_rupee),
                      label: const Text("Buy")),
                ],
              ),
              leading: SizedBox(
                  height: 100.0,
                  width: 100.0, // fixed width and height
                  child: Image.asset(
                    im,
                    fit: BoxFit.cover,
                  ))),
        ),
      ),
    );
  }
}
