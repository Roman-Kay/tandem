import 'package:flutter/material.dart';
import 'package:tandem/core/navigation/slide_right_route.dart';
import 'package:tandem/core/presentation/widgets/avatar_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'chat_screen.dart';

class PeopleScreen extends StatelessWidget {
  // const PeopleScreen({Key? key}) : super(key: key);

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return
      StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        // itemCount: imageList2.length,
        itemCount: 150,
        itemBuilder: (context, index) {
          double h = index % 3 == 0 ? 100 : 40;

          return
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                  top:
                  index   == 0 ||  index   == 2 ? 70 : 30
              ),

              child: GestureDetector(
                onTap: (){

                  Navigator.push(context,
                      SlideRightRoute(page:ChatScreen(tag: index)));
                },
                child: AvatarWidget(
                    number: index == 0 || index == 1 || index == 2 ? '${index +1 }' : null,
                    online: index == 0 || index == 6 || index == 8 ? true : false,
                    border: index == 0 || index == 1 || index == 2 ? true : false,
                    size: 120, avatar: 'assets/images/user_1.png'),
              ),
            );
        },


        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 8.0,
      );

  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 3,
      itemCount: 150,
      itemBuilder: (context, index) {
        double h = index % 3 == 0 ? 100 : 40;

       return
         Container(
           margin: EdgeInsets.only(
               top:
               index   == 0 ||  index   == 2 ? 40 : 0
           ),
            width: 100,
             height: 100,
            child: AvatarWidget(size: 40, avatar: 'assets/images/user_1.png'),
           // color: Colors.green, child: Text('$index')
            );
         //
         // imageList2[index];

      },

      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 8.0,
    );
  }
}

class ImageData {
  final String id;
  final String imageUrl;

  const ImageData({
     required this.id,
     required this.imageUrl,
  });
}

 var imageList2 = [

   Container(width: 100, height: 120, color: Colors.green),
   Container(width: 100, height: 100, color: Colors.red),
   Container(width: 100, height: 120, color: Colors.blue),
   Container(width: 100, height: 100, color: Colors.cyanAccent),
   Container(width: 100, height: 100, color: Colors.orange),
   Container(width: 100, height: 100, color: Colors.purpleAccent),
   Container(width: 100, height: 100, color: Colors.grey),
   Container(width: 100, height: 100, color: Colors.deepPurple),
   Container(width: 100, height: 100, color: Colors.deepOrangeAccent),
   Container(width: 100, height: 100, color: Colors.yellow),
   Container(width: 100, height: 100, color: Colors.green),
   Container(width: 100, height: 100, color: Colors.brown),


];


const imageList = [
  ImageData(
    id: 'id-001',
    imageUrl: 'https://picsum.photos/seed/image001/500/500',
  ),
  ImageData(
    id: 'id-002',
    imageUrl: 'https://picsum.photos/seed/image002/500/800',
  ),
  ImageData(
    id: 'id-003',
    imageUrl: 'https://picsum.photos/seed/image003/500/300',
  ),
  ImageData(
    id: 'id-004',
    imageUrl: 'https://picsum.photos/seed/image004/500/900',
  ),
  ImageData(
    id: 'id-005',
    imageUrl: 'https://picsum.photos/seed/image005/500/600',
  ),
  ImageData(
    id: 'id-006',
    imageUrl: 'https://picsum.photos/seed/image006/500/500',
  ),
  ImageData(
    id: 'id-007',
    imageUrl: 'https://picsum.photos/seed/image007/500/400',
  ),
  ImageData(
    id: 'id-008',
    imageUrl: 'https://picsum.photos/seed/image008/500/700',
  ),
  ImageData(
    id: 'id-009',
    imageUrl: 'https://picsum.photos/seed/image009/500/600',
  ),
  ImageData(
    id: 'id-010',
    imageUrl: 'https://picsum.photos/seed/image010/500/900',
  ),
  ImageData(
    id: 'id-011',
    imageUrl: 'https://picsum.photos/seed/image011/500/900',
  ),
  ImageData(
    id: 'id-012',
    imageUrl: 'https://picsum.photos/seed/image012/500/700',
  ),
  ImageData(
    id: 'id-013',
    imageUrl: 'https://picsum.photos/seed/image013/500/700',
  ),
  ImageData(
    id: 'id-014',
    imageUrl: 'https://picsum.photos/seed/image014/500/800',
  ),
  ImageData(
    id: 'id-015',
    imageUrl: 'https://picsum.photos/seed/image015/500/500',
  ),
  ImageData(
    id: 'id-016',
    imageUrl: 'https://picsum.photos/seed/image016/500/700',
  ),
  ImageData(
    id: 'id-017',
    imageUrl: 'https://picsum.photos/seed/image017/500/600',
  ),
  ImageData(
    id: 'id-018',
    imageUrl: 'https://picsum.photos/seed/image018/500/900',
  ),
  ImageData(
    id: 'id-019',
    imageUrl: 'https://picsum.photos/seed/image019/500/800',
  ),
];

class ImageCard extends StatelessWidget {
  const ImageCard({required this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}
