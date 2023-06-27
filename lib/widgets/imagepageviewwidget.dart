import 'package:flutter/material.dart';

class ImagePageViewWidget extends StatelessWidget {
  const ImagePageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Center(
              child: Text(
                'Pet $index',
              ),
            ),
          ),
        ),
        Positioned(
          top: 5.0,
          right: 10.0,
          child: IconButton(
            // style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
        ),
      ],
    );
  }
}
