import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sos_app/PostDetailScreen.dart';
import 'package:sos_app/models/Post.dart';
import 'package:sos_app/categories/LegislationScreen.dart';
import 'package:sos_app/categories/LawScreen.dart';
import 'package:sos_app/categories/EnvironmentScreen.dart';
import 'package:sos_app/categories/InfrastructureScreen.dart';
import 'package:sos_app/categories/SecurityScreen.dart';
import 'package:sos_app/categories/CivilScreen.dart';
import 'package:sos_app/categories/CriminalScreen.dart';
import 'ProfileScreen.dart';
import 'SettingsScreen.dart';

class HomePageScreen extends StatelessWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  const HomePageScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/img/categories/Legislation.jpg',
      'assets/img/categories/law.jpeg',
      'assets/img/categories/environment.jpeg',
      'assets/img/categories/Infrastructure.png',
      'assets/img/categories/security.jpg',
      'assets/img/categories/civilian.png',
      'assets/img/categories/criminal.png'
    ];

    final List<Post> posts = [
      Post(
        imageCover: 'assets/img/posts/one.jpg',
        title:
            'صور شعائر صلاة  عيد الأضحى في عدد من ساحات ببلدية سواني بن آدم ',
        content: 'Content of post 1',
      ),
      Post(
        imageCover: 'assets/img/posts/two.jpg',
        title:
            'تواصل الشركة المنفذة لمشروع الطريق الرابط بين جامع العمائم وطريق مقبرة المدنيني ',
        content:
            ' تواصل الشركة المنفذة لمشروع الطريق الرابط بين جامع العمائم وطريق مقبرة المدنيني في عملية تسوية الطريق من أجل البدء في وضع الطبقة الأولى  الميستو شكرا لمكتب المشروعات بالبلدية على مجهوداتهم المبدولة في متابعة المشروعات التي يتم تنفيذها',
      ),
      // Add more posts here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الصفحة الرئيسية',
          style: TextStyle(fontFamily: 'TajawalRegular'),
        ),
      ),
      drawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.only(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/drawer-cov.jpg',
                      height: 130, // Adjust the height as needed
                      width: 300,
                      fit: BoxFit
                          .cover, // This will cover the entire space allocated
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'الملف الشخصي',
                  style: TextStyle(fontFamily: 'TajawalRegular'),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'الإعدادات',
                  style: TextStyle(fontFamily: 'TajawalRegular'),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen(
                              toggleDarkMode: toggleDarkMode,
                              isDarkMode: isDarkMode)));
                },
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imagePaths.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'الفئات',
                  style: TextStyle(
                    fontFamily: 'TajawalRegular',
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryItem(
                        context,
                        'قرارات',
                        'assets/img/categories/Legislation.jpg',
                        const LegislationScreen()),
                    buildCategoryItem(context, 'تشريع',
                        'assets/img/categories/law.jpeg', const LawScreen()),
                    buildCategoryItem(
                        context,
                        'بيئية',
                        'assets/img/categories/environment.jpeg',
                        const EnvironmentScreen()),
                    buildCategoryItem(
                        context,
                        'البنية التحتية',
                        'assets/img/categories/Infrastructure.png',
                        const InfrastructureScreen()),
                    buildCategoryItem(
                        context,
                        'أمنية',
                        'assets/img/categories/security.jpg',
                        const SecurityScreen()),
                    buildCategoryItem(
                        context,
                        'مدنية',
                        'assets/img/categories/civilian.png',
                        const CivilScreen()),
                    buildCategoryItem(
                        context,
                        'جنائية',
                        'assets/img/categories/criminal.png',
                        const CriminalScreen()),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'المشاركات',
                  style: TextStyle(
                    fontFamily: 'TajawalRegular',
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: posts
                      .map((post) => buildPostItem(context, post))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(BuildContext context, String label, String imagePath,
      Widget targetScreen) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => targetScreen,
            ),
          );
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style:
                  const TextStyle(fontFamily: 'TajawalRegular', fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPostItem(BuildContext context, Post post) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PostDetailScreen(post: post),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(post.imageCover),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                post.title,
                style:
                    const TextStyle(fontFamily: 'TajawalRegular', fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                post.content,
                style:
                    const TextStyle(fontFamily: 'TajawalRegular', fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
