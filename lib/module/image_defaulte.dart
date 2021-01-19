import 'package:flutter/material.dart';

//默认图片
class ImageWidget extends StatefulWidget {
  ImageWidget(
      {@required this.url,
      this.w,
      this.h,
      this.defImagePath = "assets/img/homse.jpg"});

  final String url;
  final double w;
  final double h;
  final String defImagePath;

  @override
  State<StatefulWidget> createState() {
    return _StateImageWidget();
  }
}

class _StateImageWidget extends State<ImageWidget> {
  Image _image;

  @override
  void initState() {
    super.initState();

    _image = Image.network(
      widget.url,
      width: widget.w,
      height: widget.h,
      fit: BoxFit.cover,
    );

    var resolve = _image.image.resolve(ImageConfiguration.empty);
    resolve.addListener(ImageStreamListener((_, __) {
      //加载成功
    }, onError: (dynamic exception, StackTrace stackTrace) {
      //加载失败
      setState(() {
        _image = Image.asset(
          widget.defImagePath,
          width: widget.w,
          height: widget.h,
        );
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return _image;
  }
}
