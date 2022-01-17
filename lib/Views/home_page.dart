import 'package:dokan/InputModel/product.dart';
import 'package:dokan/Utils/constants.dart';
import 'package:dokan/controller/controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FileController _fileController;
  List<Product> productList = [];
  String ss = "";
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;
  bool check5 = false;

  reset() {
    check1 = false;
    check2 = false;
    check3 = false;
    check4 = false;
    check5 = false;
  }

  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  void initState() {
    _fileController = FileController();
    _fileController.loadProductsFromAssets('assets/files/respons.json');
    _fileController.addListener(() {
      setState(() {
        productList = _fileController.productData;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: key,
      backgroundColor: backgroundColor,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Stack(clipBehavior: Clip.none, children: [
              const Padding(
                padding: EdgeInsets.only(top: 7.0),
                child: Text(
                  "Products List.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Positioned(
                left: width * 0.5,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Icon(
                    Icons.search,
                    size: 40,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add_road_sharp),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<FilterType>(
                            context: context,
                            isDismissible: false,
                            builder: (context) {
                              return const BottomSheet();
                            }).then((value) {
                          if (value == FilterType.newest) {
                            productList.sort((a, b) => a.dateModified
                                .toString()
                                .compareTo(b.dateModified.toString()));
                          } else if (value == FilterType.oldest) {
                            productList.sort((a, b) => a.dateModified
                                .toString()
                                .compareTo(b.dateModified.toString()));
                          } else if (value == FilterType.highToLow) {
                            productList.sort((a, b) => a.price
                                .toString()
                                .compareTo(b.price.toString()));
                          } else if (value == FilterType.lowToHigh) {
                            productList.sort((a, b) => a.price
                                .toString()
                                .compareTo(b.price.toString()));
                          } else {
                            productList.sort((a, b) => a.salePrice
                                .toString()
                                .compareTo(b.salePrice.toString()));
                          }
                        });
                        /*key.currentState!.showBottomSheet((context) => */
                      },
                      child: const Text(
                        "Filter",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.4,
                    ),
                    const Text(
                      "Sort by",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                    const Icon(Icons.list),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: productList.length,
                  itemBuilder: (ctx, idx) {
                    return ProductCard(product: productList[idx]);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fileController.dispose();
    super.dispose();
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 4,
        shadowColor: Colors.black38,
        child: SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(product.images!.first.src!),
              ),
              Expanded(
                child: Text(product.name.toString()),
              ),
              Expanded(
                child: Text("${product.price}"),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  FilterType _selectedFilter = FilterType.none;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(26.0),
              child: Text(
                "Filter",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          CheckboxListTile(
              activeColor: const Color(0xffFF679B),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Newest'),
              value: isFilterChecked(FilterType.newest),
              onChanged: (value) {
                _handleFilterValue(FilterType.newest, value);
              }),
          CheckboxListTile(
              activeColor: const Color(0xffFF679B),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Oldest'),
              value: isFilterChecked(FilterType.oldest),
              onChanged: (value) {
                _handleFilterValue(FilterType.oldest, value);
              }),
          CheckboxListTile(
              activeColor: const Color(0xffFF679B),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Price Low -> High'),
              value: isFilterChecked(FilterType.lowToHigh),
              onChanged: (value) {
                _handleFilterValue(FilterType.lowToHigh, value);
              }),
          CheckboxListTile(
              activeColor: const Color(0xffFF679B),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Price High -> Low'),
              value: isFilterChecked(FilterType.highToLow),
              onChanged: (value) {
                _handleFilterValue(FilterType.highToLow, value);
              }),
          CheckboxListTile(
              activeColor: const Color(0xffFF679B),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Best Selling'),
              value: isFilterChecked(FilterType.bestSelling),
              onChanged: (value) {
                _handleFilterValue(FilterType.bestSelling, value);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Cancel'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, _selectedFilter);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleFilterValue(FilterType type, bool? value) {
    if (value == true) {
      setState(() {
        _selectedFilter = type;
      });
    }
  }

  bool isFilterChecked(FilterType type) {
    return _selectedFilter == type;
  }
}

enum FilterType { newest, oldest, lowToHigh, highToLow, none, bestSelling }
