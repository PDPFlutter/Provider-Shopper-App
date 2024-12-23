import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shopper/pages/order/order_provider.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = context.read<OrderProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                // Todo write
              },
              child: const Icon(
                CupertinoIcons.delete_simple,
                color: Colors.black,
                size: 27.5,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: orderProvider.orders.orders.length + 1,
        itemBuilder: (context, index) {
          if (index == orderProvider.orders.orders.length) {
            return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 15),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total: ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "${orderProvider.orders.total} sum",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          var order = orderProvider.orders.orders[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // #image
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(order.product.images[0]),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // #details
                  SizedBox(
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // #title
                        Expanded(
                          child: Text(
                            "${order.product.title} ${order.product.companyName}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            maxLines: 2,
                          ),
                        ),

                        // #total
                        Expanded(
                            child: Text(
                              "${order.total} sum",
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            )),

                        // #quantity
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // #minus
                              GestureDetector(
                                onTap: () => orderProvider.minus(order),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    child: const Icon(CupertinoIcons.minus)),
                              ),
                              const SizedBox(width: 10),

                              // #quantity
                              Consumer<OrderProvider>(
                                  builder: (context, provider, child) {
                                    return Text(
                                      order.quantity.toString(),
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    );
                                  }),
                              const SizedBox(width: 10),

                              // #plus
                              GestureDetector(
                                onTap: () => orderProvider.plus(order),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(CupertinoIcons.plus),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      // todo write code for remove
                    },
                    child: const Icon(CupertinoIcons.xmark),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}