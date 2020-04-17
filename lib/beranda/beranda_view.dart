import 'package:flutter/material.dart';
import 'package:landing_page/beranda/beranda_appbar.dart';
import 'package:landing_page/beranda/beranda_model.dart';
import 'package:landing_page/constant.dart';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {

  List<PilihanMenu> _pilihanList = [];
  List<Berita> _beritaList = [];

  @override
  void initState() {
    super.initState();

    _pilihanList.add(new PilihanMenu(
        image: Icons.format_color_text,
        color: UtyPalette.menuRide,
        title: "Akreditasi"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.today,
        color: UtyPalette.menuCar,
        title: "Events"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.library_books,
        color: UtyPalette.menuBluebird,
        title: "News"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.local_library,
        color: UtyPalette.menuFood,
        title: "Perpustakaan"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.school,
        color: UtyPalette.menuSend,
        title: "Prodi"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.account_balance,
        color: UtyPalette.menuDeals,
        title: "Profil"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.description,
        color: UtyPalette.menuPulsa,
        title: "Sertifikasi"));
    _pilihanList.add(new PilihanMenu(
        image: Icons.supervisor_account,
        color: UtyPalette.menuOther,
        title: "Alumni"));
    _beritaList.add(
        new Berita(title: "Seminar", image: "assets/news/01.jpeg"));
    _beritaList.add(
        new Berita(title: "Serah Terima", image: "assets/news/02.jpeg"));
    _beritaList.add(
        new Berita(title: "Orchestra", image: "assets/news/03.jpeg"));
    _beritaList.add(
        new Berita(title: "Pengajian", image: "assets/news/04.jpeg"));
    _beritaList.add(
        new Berita(title: "Kunjungan", image: "assets/news/05.jpeg"));

  }

  Widget _rowPilihanMenu(PilihanMenu pilihanMenu){
    return new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                new Container(
                decoration: new BoxDecoration(
                  border: Border.all(color: UtyPalette.grey200, width: 1.0),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(20.0))),
                padding: EdgeInsets.all(12.0),
                child : new Icon(
                  pilihanMenu.image,
                  color: pilihanMenu.color,
                  size: 32.0,
                  ),
                ),
              new Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              new Text(pilihanMenu.title, style: new TextStyle(fontSize: 10.0))
            ],
           ),
          );
    }

  Widget _buildBeritaFeatured() {
    return new Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
      new Text(
      "HEADLINE NEWS",
        style: new TextStyle(fontFamily: "NeoSansBold"),
      ),
      new Padding(
        padding: EdgeInsets.only(top: 8.0),
      ),
      new Text(
        "Berita Terbaru",
        style: new TextStyle(fontFamily: "NeoSansBold"),
      ),
      new SizedBox(
        height: 172.0,
        child: new ListView.builder(
          itemCount: _beritaList.length,
          padding: EdgeInsets.only(top: 12.0),
          physics: new ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _rowBeritaFeatured(_beritaList[index]);
          },
          ),
          ),
        ],
      ),
    );
  }

  Widget _rowBeritaFeatured(Berita berita) {
    return new Container(
      margin: EdgeInsets.only(right: 16.0),
      child: new Column(
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(8.0),
            child: new Image.asset(
              berita.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          new Text(
            berita.title,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
          appBar: new UtyAppBar(),
          body: new Container(child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      _buildsitusMenu(),
                      _buildpilihanMenu()
                    ],
                  )),
          new Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 16.0),
            child: new Column(
              children: <Widget>[
                _buildBeritaFeatured(),
           ]
          ),
          )
            ],
          ),
          ),
        ),
    );
  }

  Widget _buildpilihanMenu() {
    return new SizedBox(
        width: double.infinity,
        height: 220.0,
        child: new Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: 8,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowPilihanMenu(_pilihanList[position]);
                })));
  }

  Widget _buildsitusMenu() {
    return new Container(
        height: 120.0,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(3.0))),
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(12.0),
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                  ),
                  borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(3.0),
                      topRight: new Radius.circular(3.0))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Universitas Teknologi Yogyakarta",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: Colors.yellow,
                        fontFamily: "NeoSansBold"),
                  ),
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/fb.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Facebook",
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/ig.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Instagram",
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/tw.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Twitter",
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      )
                    ],
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons/yt.png",
                        width: 32.0,
                        height: 32.0,
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      new Text(
                        "Youtube",
                        style: TextStyle(color: Colors.white, fontSize: 10.0),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}