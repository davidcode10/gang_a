import 'package:flutter/material.dart';
import 'package:gang_app/model/video_model.dart';

class VideoCard extends StatelessWidget {
  final VideoModel videoModel;
  const VideoCard({Key? key, required this.videoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(videoModel.urlVideo);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (videoModel.urlImage != null)
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    videoModel.urlImage!,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text("${videoModel.title}"),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  "${videoModel.subtitle}",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
