import 'package:flutter/material.dart';
import '../models/affordability.dart';
import '../models/complexity.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.duration,
    @required this.complexity,
  });

  void _selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(Icons.schedule),
                  SizedBox(
                    width: 6,
                  ),
                  Text('$duration min'),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.work),
                  SizedBox(
                    width: 6,
                  ),
                  Text('${complexity.name}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
