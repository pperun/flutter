import 'dart:math';

import 'models/post.dart';
import 'models/post_type.dart';
import 'models/user.dart';

class Data {
  static User getUser() {
    return User(
        name: 'Name Surname',
        tagName: 'name_surname',
        profilePicture:
            'https://www.ohchr.org/sites/default/files/styles/hero_5_image_desktop/public/2022-11/women-rights-main-image.jpg?itok=RRGl2PFb');
  }

  static List<User> getUsers() {
    Random random = Random();
    List<String> pics = [
      'https://cdn.britannica.com/45/5645-050-B9EC0205/head-treasure-flower-disk-flowers-inflorescence-ray.jpg',
      'https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg',
      'https://img.freepik.com/free-vector/spring-flower-collection_23-2148853687.jpg?w=2000',
      'https://www.southernliving.com/thmb/xFlQn020pc1NJAl4ksr7_o_B5u4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-598083938-1-22dab883ff2a43d8b2751d9f363f2d5d.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg/845px-Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg',
      'https://hips.hearstapps.com/hmg-prod/images/summer-flowers-star-flower-1648071187.jpg',
      'https://images.unsplash.com/photo-1562690868-60bbe7293e94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cm9zZSUyMGZsb3dlcnxlbnwwfHwwfHw%3D&w=1000&q=80'
    ];
    List<User> users = [
      User(
          name: 'Name Surname',
          tagName: 'name_surname',
          profilePicture:
              'https://www.ohchr.org/sites/default/files/styles/hero_5_image_desktop/public/2022-11/women-rights-main-image.jpg?itok=RRGl2PFb'),
      User(
          name: 'Sarah Puff',
          tagName: 'puffy_s',
          profilePicture:
              'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      User(
          name: 'John DeLorean',
          tagName: 'j_dm12',
          profilePicture:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAYT79DRx3a2Eol6KHetbxiSjJ3LiTvDB_VSsCw6EoG7KSdgrqLXkFpibVEyM9cGWKXmg&usqp=CAU'),
      User(
          name: 'Bob Ross',
          tagName: 'bob.ross',
          profilePicture:
              'https://m.media-amazon.com/images/M/MV5BNzg0MWEyZjItOTZlMi00YmRjLWEyYzctODIwMDU0OThiMzNkXkEyXkFqcGdeQXVyNjUxMjc1OTM@._V1_.jpg'),
      User(
          name: 'Arina Madelaine',
          tagName: 'madelainelady',
          profilePicture:
              'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      User(
          name: 'Name Surname',
          tagName: 'nm100',
          profilePicture:
              'https://www.telegraph.co.uk/content/dam/news/2022/11/20/TELEMMGLPICT000316877343_trans_NvBQzQNjv4BqBtcuE30gAEgyOHhNTLm9ZLc_02QokmPMl3eLabfstKk.jpeg?imwidth=680'),
      User(
          name: 'Dani Sunak',
          tagName: 's_dani',
          profilePicture:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6WyAUW7eK5FUa6l4LjvsxRRSYKZLR2sLY9Q&usqp=CAU')
    ];
    for (int i = 0; i < users.length; i++) {
      users[i].posts = [
        Post(
            id: users[i].id,
            type: PostType.post,
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            contentLinks: [pics[i]],
            likesCounter: random.nextInt(10000),
            commentsCounter: random.nextInt(10000))
      ];
    }
    return users;
  }
}
