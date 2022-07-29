import 'package:flutter/material.dart';
import 'package:kmart/homescreen.dart';
import 'package:kmart/modelpage.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key, required this.items}) : super(key: key);
  final List<Product> items;
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  num total = 0;
  num i = 0;
  var changeIndex;

  List<Product> allproducts = [
    Product(id: 1, name: "Apple", price: 50),
    Product(id: 2, name: "Mango", price: 70),
    Product(id: 3, name: "Orange", price: 40),
    Product(id: 4, name: "Pineapple", price: 50),
    Product(id: 5, name: "Grapes", price: 70),
    Product(id: 6, name: "Kiwi", price: 100),
    Product(id: 7, name: "Bananas", price: 30),
    Product(id: 8, name: "Gvava", price: 45)
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
  List<Product> product = [];

  @override
  void initState() {
    product = allproducts;
    //cart.length=;
    for (var element in cart) {
      total = total + element.price! * element.qty!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart_List(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Row(
          children: const [
            //Icon(Icons.local_grocery_store),
            Text("Products"),
          ],
        ),
        // actions: [
        //   GestureDetector(
        //       onTap: () {},
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Stack(clipBehavior: Clip.none, children: [
        //           ElevatedButton.icon(
        //             onPressed: () {},
        //             icon: const Icon(Icons.local_grocery_store),
        //             label: const Text("cart"),
        //             style: TextButton.styleFrom(backgroundColor: Colors.green),
        //           ),
        //           Positioned(
        //               top: -8,
        //               right: -8,
        //               child: Container(
        //                 padding: const EdgeInsets.all(5),
        //                 decoration: const BoxDecoration(
        //                     color: Colors.red, shape: BoxShape.circle),
        //                 child: Text("${cart.length}"),
        //               )),
        //         ]),
        //       )),
        // ],
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) => item(cart[index], ima[index]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(" Your Amount is $total"),
            style: ElevatedButton.styleFrom(
              shadowColor: const Color.fromARGB(255, 42, 223, 48),
              elevation: 50,

              //shape: RoundedRectangleBorder(borderRadius: Bor),
            ),
          ),
        ],
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
                  Text("x ${product.qty}"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (cart.any((element) => element.id == product.id)) {
                          changeIndex = cart.indexWhere(
                              (element) => element.id == product.id);
                          if (cart[changeIndex].qty == 1) {
                            cart.remove(product);
                          } else {
                            cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                          }
                        }
                        //cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                        //////////////////////////////  if(cart[changeIndex]==0){}

                        // } else {
                        //   setState(() {
                        //      cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                        //     // cart.remove(product);
                        //   });
                        // }
                        total = 0;
                        for (var element in cart) {
                          setState(() {
                            total = total + (element.qty! * element.price!);

                            // total= (cart[changeIndex].qty!* element.price!)-total;
                          });
                        }
                      });
                    },
                    //label: Text(""),
                    icon: const Icon(Icons.remove),
                  )
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
