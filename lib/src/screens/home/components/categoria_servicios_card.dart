import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';

import '../../../utils/constant.dart';

class CategoriaServiciosCard extends StatelessWidget {
  final String _title;
  final String _imageUrl;
  final Color _bgColor;

  const CategoriaServiciosCard(this._title, this._imageUrl, this._bgColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 160,
      child: Stack(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 110,
              height: 137,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _title,
                  style: const TextStyle(
                    color: kTitleTextColor,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Image.asset(_imageUrl),
                onPressed: () async {
                  await AutoRouter.of(context).push(const TextFormFieldRoute());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
