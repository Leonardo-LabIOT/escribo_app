import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class ReaderView extends StatefulWidget {
  final int id;
  final String title;
  final String url;

  ReaderView({required this.id, required this.title, required this.url});

  @override
  _ReaderViewState createState() => _ReaderViewState();
}

class _ReaderViewState extends State<ReaderView> {
  bool loading = false;
  Dio dio = Dio();
  String filePath = "";

  @override
  void initState() {
    super.initState();
    download();
  }

  Future<void> download() async {
    if (Platform.isAndroid) {
      try {
        String firstPart;
        final deviceInfoPlugin = DeviceInfoPlugin();
        final deviceInfo = await deviceInfoPlugin.deviceInfo;
        final allInfo = deviceInfo.data;
        firstPart = allInfo['version']["release"].toString().split('.').first;

        int intValue = int.parse(firstPart);
        if (intValue >= 13) {
          await startDownload();
        } else {
          if (await Permission.storage.isGranted) {
            await Permission.storage.request();
            await startDownload();
          } else {
            setState(() {
              loading = false;
            });
          }
        }
      } catch (e) {
        print("Error in download: $e");
        setState(() {
          loading = false;
        });
      }
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
        ),
        body: Center(
          child: loading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Downloading.... E-pub'),
                  ],
                )
              : Container(), // Nenhum widget visível quando não está carregando
        ),
      ),
    );
  }

  Future<void> startDownload() async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = appDocDir!.path + '/book${widget.id}.epub';
    File file = File(path);

    try {
      if (!File(path).existsSync()) {
        await file.create();
        await dio.download(
          widget.url,
          path,
          deleteOnError: true,
          onReceiveProgress: (receivedBytes, totalBytes) {
            setState(() {
              loading = true;
            });
          },
        ).whenComplete(() {
          setState(() {
            loading = false;
            filePath = path;
            openEpub(); // Chama a função para abrir o epub após o download
          });
        });
      } else {
        setState(() {
          loading = false;
          filePath = path;
          openEpub(); // Chama a função para abrir o epub se já existir
        });
      }
    } catch (e) {
      print("Error in startDownload: $e");
      setState(() {
        loading = false;
      });
    }
  }

  void openEpub() {
    VocsyEpub.setConfig(
      themeColor: Theme.of(context).primaryColor,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: true,
    );
    VocsyEpub.locatorStream.listen((locator) {
      print('LOCATOR: $locator');
    });

    VocsyEpub.open(
      filePath,
      lastLocation: EpubLocator.fromJson({
        "bookId": widget.id.toString(),
        "href": "/OEBPS/ch06.xhtml",
        "created": DateTime.now().millisecondsSinceEpoch,
        "locations": {"cfi": "epubcfi(/0!/4/4[book${widget.id}]/2/2/6)"}
      }),
    );
  }
}
