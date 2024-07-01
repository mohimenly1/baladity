import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LegislationScreen extends StatefulWidget {
  const LegislationScreen({super.key});

  @override
  _LegislationScreenState createState() => _LegislationScreenState();
}

class _LegislationScreenState extends State<LegislationScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=8RMMzsSP00I")!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pdfFiles = [
      {
        "title":
            "قرار رقم 128 بشأن آلية اعتماد عمل البرنامج الوطني لنقل الاختصاصات",
        "url":
            "https://drive.google.com/file/d/1u2pk3RnaaHeM51Cae60oLtPv8rWc-4ad/view?usp=sharing"
      },
      {
        "title":
            "قرار رقم 616 بشأن تنظيم الامانة العامة للمجلس الاعلى للادارة المحلية",
        "url":
            "https://drive.google.com/file/d/1CjSD-cgQCojMYI3k_SqqvW8GV3ajnSgY/view?usp=sharing"
      },
      {
        "title":
            "قرار رقم 660 بشأن اعتماد الهيكل التنظيمي لوزارة الحكم المحلي",
        "url":
            "https://drive.google.com/file/d/1xVMB0kCBqobMD2xOfQn71lxzYDgWFozN/view?usp=sharing"
      },
      {
        "title":
            "قرار رقم 1500 لسنة 2022 بشان اعتماد التنظيم الداخلي للهيكل الموحد للبلديات",
        "url":
            "https://drive.google.com/file/d/1GKLuI52jHDjtnShVLeJGXxnMprLhk3tK/view?usp=sharing"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('قرارات',
            style: TextStyle(fontFamily: 'TajawalRegular')),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'برنامج الحكم المحلي',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'TajawalRegular',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              Text(
                'الحلقة الأولى\nمبادرة الاسكان الشبابي والأسر المحتاجة',
                style: TextStyle(fontSize: 20, fontFamily: 'TajawalRegular'),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 20),
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'القرارات',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'TajawalRegular',
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: pdfFiles.length,
                itemBuilder: (context, index) {
                  final file = pdfFiles[index];
                  return ListTile(
                    title: Text(
                      file['title']!,
                      style: const TextStyle(fontFamily: 'TajawalRegular'),
                      textAlign: TextAlign.right,
                    ),
                    trailing: Icon(Icons.picture_as_pdf,
                        color: Theme.of(context).primaryColor),
                    onTap: () => _launchURL(file['url']!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
