import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/api/http_api.dart';
import 'package:flutter_course/model/product.dart';
import 'package:flutter_course/ui/common/csutom_drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Foods';
  UserProvider? userProvider;
  int offset = 0;
  int limit = 10;
  final _scrollController = TrackingScrollController();

  @override
  void initState() {
    super.initState();
  }

  Future getProducts() async {
    try {
      String url = 'api/product?offset=$offset&limit=$limit';
      await HttpApi.get(url).then((value) {
        print(value?.statusCode);
        if (value?.statusCode == 200) {
          final body = productModelFromJson(value!.body);
          if (body.isEmpty) {
            print('not found');
          } else {
            if (userProvider!.products == null) {
              userProvider!.setProducts(body);
            } else {
              userProvider!.products!.addAll(body.reversed);
              userProvider!.setProducts(userProvider!.products!);
            }
            print(offset);
            offset += limit;
            print(offset);
          }
        } else {
          //
          print('not found');
        }
      });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;

    if (userProvider == null) {
      userProvider = Provider.of<UserProvider>(context);
      getProducts();
    }
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          final products = provider.products;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                primary: true,
                backgroundColor: Colors.transparent,
                expandedHeight: 300,
                // pinned: false,
                // floating: false,

                flexibleSpace: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Bird.jpg',
                            ),
                          ),
                        ),
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                    Positioned(
                      child: Container(
                        height: 20,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      // top: 20,
                      left: 0,
                      right: 0,
                      bottom: -2,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              if(products != null)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        print(products[index].img);
                    return Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Image.network(
                            'http://192.168.1.79:8007/api/product/image?img_path=${products[index].img}&index=${index + 1}',
                            width: 100,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].title!),
                              Text('${products[index].price} kip'),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          TabItem(icon: Icons.no_food, title: 'Foods'),
          TabItem(icon: Icons.local_drink, title: 'Drink'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.format_list_bulleted_sharp, title: 'My oders'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int index) {
          print('click index=$index');
          if (index == 0) {
            setState(() {
              title = 'Foods';
            });
          } else if (index == 1) {
            setState(() {
              title = 'Drink';
            });
          } else if (index == 2) {
            setState(() {
              title = 'Cart';
            });
          } else {
            setState(() {
              title = 'My Orders';
            });
          }
        },
      ),
    );
  }
}