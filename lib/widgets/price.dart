import 'package:flutter/material.dart';
import 'package:fasal/constants/constants.dart';

class Price extends StatefulWidget {
  const Price({Key? key}) : super(key: key);

  @override
  _PriceState createState() => _PriceState();
}

class _PriceState extends State<Price> {
  Widget bodyData() => DataTable(
      sortAscending: true,
      // sortColumnIndex: 0,
      dividerThickness: 3.0,
      columns: <DataColumn>[
        DataColumn(
          label: Text('Fruits'),
          numeric: false,
          tooltip: 'Names of the fruits',
          // onSort: (i, b) {
          //   setState(() {
          //     fruits.sort(
          //       (a, b) => a.fruitName.compareTo(b.fruitName),
          //     );
          //   });
          // },
        ),
        DataColumn(
          label: Text('Weight'),
          numeric: false,
          tooltip: 'Weight of the fruits',
          // onSort: (i, b) {
          //   print("$i $b");
          //   setState(() {
          //     fruits.sort(
          //       (a, b) => a.weight.compareTo(b.weight),
          //     );
          //   });
          // },
        ),
        DataColumn(
          label: Text('Price'),
          numeric: true,
          tooltip: 'Price of the fruits',
          // onSort: (i, b) {
          //   setState(() {
          //     fruits.sort(
          //       (a, b) => a.price.compareTo(b.price),
          //     );
          //   });
          // },
        ),
      ],
      rows: fruits
          .map(
            (Fruits) => DataRow(cells: [
              DataCell(
                Text(Fruits.fruitName),
              ),
              DataCell(
                Text(Fruits.weight),
              ),
              DataCell(
                Text(Fruits.price),
              ),
            ]),
          )
          .toList());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: eggShell,
      appBar: AppBar(
        backgroundColor: androidGreen,
        title: Text('Market Prices'),
      ),
      // drawer: MyDrawer(),
      body: bodyData(),
    );
  }
}

class Fruits {
  String fruitName;
  String weight;
  String price;
  Fruits({required this.fruitName, required this.weight, required this.price});
}

var fruits = <Fruits>[
  Fruits(fruitName: 'Apple', weight: '1 KG', price: '220.00'),
  Fruits(fruitName: 'Avocado (Avocado Palam)', weight: '1 KG', price: '180.00'),
  Fruits(
    fruitName: 'Green Banana (Pachai Valaipalam)',
    weight: '1 KG',
    price: '60.00',
  ),
];
// Text(
// 'Apple (Apple)	1 Kg	220.00 \nAvocado (Avocado Palam)	1 Kg	180.00\nBlack Grape (Karuppu Thiratchai)	1 Kg	80.00'
// '\nCherry (Cherry Palam)	1 Kg	600.00\nCoconut (Thengai)	1 Piece	30.00\nCustard Apple (Seethapalam)	1 Kg	140.00\n'
// 'Date (Pericham Palam)	1 Kg	480.00\nFig (Athipalam)	1 Kg	180.00\nGooseberry (Nellikai)	1 Kg	220.00'
// '\nGreen Banana (Pachai Valaipalam)	1 Kg	60.00Green Grape (Pachai Thiratchai)	1 Kg	80.00\nJackfruit (Palapalam)	1 Kg	170.00\n'
// 'Lemon (Elumichai)	1 Kg	175.00\nMango (Mambalam)	1 Kg	70.00\nMosambi (Sathukudi Palam)	1 Kg	60.00\nOrange (Orange)	1 Kg	70.00\n'
// 'Papaya (Pappali Palam)	1 Kg	90.00\nPeach (Peach Palam)	1 Kg	230.00\nPear (Berikai)	1 Kg	185.00\nPineapple (Annachi Palam)	1 Kg	90.00\n'
// 'Plum (Plums Palam)	1 Kg	280.00\nPomegranate (Mathulai Palam)	1 Kg	130.00\nSapota (Sapota Palam)	1 Kg	90.00\nStrawberry (Strawberry)	1 Kg	420.00\n'
// 'Watermelon (Watermelon)	1 Kg	25.00\n Yellow Banana (Manjal Valaipalam)	1 Kg	65.00',
// ),
