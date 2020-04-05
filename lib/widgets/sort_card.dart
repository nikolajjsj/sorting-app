import 'package:flutter/material.dart';
import 'package:sorting/styles.dart';

class SortCard extends StatelessWidget {
  SortCard({
    @required this.title,
    @required this.shortDescription,
    @required this.timeComplexity,
    @required this.onTap,
  });

  final String title;
  final String shortDescription;
  final String timeComplexity;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(title, style: TextStyles.title),
                    Text(timeComplexity, style: TextStyles.body)
                  ],
                ),
                SizedBox(height: 10.0),
                Text(shortDescription, style: TextStyles.body),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
