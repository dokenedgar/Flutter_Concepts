import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rounded_letter/rounded_letter.dart';

class LayoutsTuts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutsTuts();
  }
/*
  var displayName = '';
  var displayShortForm = '';
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
                icon: Icon(
              Icons.star,
              color: Colors.white,
            )),
            Tab(icon: Icon(Icons.access_time, color: Colors.white)),
            Tab(icon: Icon(Icons.people, color: Colors.white))
          ]),
          title: Text('Call Records Clone'),
        ),
        body: TabBarView(
          children: <Widget>[
            favContacts(orientation),
            orientation == Orientation.portrait
                ? buildCallRecordsPotrait(context)
                : buildCallRecordsLandscape(),
            Center(child: Text('Contacts')),
          ],
        ),
      ),
    );
  }
  */
}

class _LayoutsTuts extends State<LayoutsTuts>
    with SingleTickerProviderStateMixin {
  var displayName = '';
  var displayShortForm = '';
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Call Records Clone'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                  icon: Icon(
                Icons.star,
                color: Colors.white,
              )),
              Tab(icon: Icon(Icons.access_time, color: Colors.white)),
              Tab(
                icon: Icon(Icons.people, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            favContacts(orientation),
            orientation == Orientation.portrait
                ? buildCallRecordsPotrait(context)
                : buildCallRecordsLandscape(),
            contacts()
          ],
        ),
        floatingActionButton: _bottomButtons(),
        floatingActionButtonLocation: _bottomLocation(),
      ),
    );
  }

  Widget buildCallRecordsPotrait(BuildContext context) {
    var nameTitles = [];
    var callDuration = [];
    var icons = [
      Icon(
        Icons.account_circle,
        color: Colors.green,
        size: 40.0,
      ),
      Icon(
        Icons.account_circle,
        color: Colors.red,
        size: 40.0,
      ),
      Icon(
        Icons.account_circle,
        color: Colors.green,
        size: 40.0,
      ),
      Icon(
        Icons.account_circle,
        color: Colors.green,
        size: 40.0,
      ),
      Icon(
        Icons.account_circle,
        color: Colors.red,
        size: 40.0,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Yesterday',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                ),
                Spacer()
              ],
            ),
          ),
          generateList(nameTitles = ['Momsy'],
              callDuration = ['Mobile, 10 min. ago']),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Older',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                ),
                Spacer()
              ],
            ),
          ),
          generateList(
              nameTitles = ['Acid', 'Neymar', 'Don', 'Doksy 07', 'Dorcas', 'Isaac', 'Sergey', 'Naomi'],
              callDuration = [
                '30 min. ago',
                '45 min. ago',
                '58 min. ago',
                '2 hours ago',
                '5 hours ago',
                'Yesterday',
                '2 days ago',
                '2 days ago'
              ]),
        ],
      ),
    );
  }

  Widget getAvatar(String contact) {
    List colors = [
      Colors.red,
      Colors.green,
      /*Colors.blue,
      Colors.deepPurple,
      Colors.grey,
      */
    ];
    Random random = new Random();
    switch(contact){
      case 'Acid':
        return CircleAvatar(
          backgroundImage: AssetImage('images/acid.jpg'),
        );
      case 'Dorcas':
        return CircleAvatar(
          backgroundImage: AssetImage('images/dorcas.jpg'),
        );
      case 'Isaac':
        return CircleAvatar(
          backgroundImage: AssetImage('images/isaac.jpg'),
        );
      case 'Mbappe':
        return CircleAvatar(
          backgroundImage: AssetImage('images/mbappe.jpg'),
        );
      case 'Naomi':
        return CircleAvatar(
          backgroundImage: AssetImage('images/naomi.png'),
        );
      case 'Neymar':
        return CircleAvatar(
          backgroundImage: AssetImage('images/neymar.jpg'),
        );
      default:
        return  Icon(
          Icons.account_circle,
          color: colors[random.nextInt(colors.length)],
          size: 40.0,
        );
    }

  }
  ListView generateList(var nameTitles, var callDuration) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: nameTitles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
              child: ListTile(
                leading: getAvatar(nameTitles[index]),

                title: Text(nameTitles[index]),
                subtitle: Row(
                  children: <Widget>[
                    Icon(
                      Icons.call_made,
                      color: Colors.green,
                      size: 14.0,
                    ),
                    VerticalDivider(
                      width: 6.0,
                    ),
                    Text(
                      callDuration[index],
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                trailing: Icon(Icons.call),
                onTap: () => print(nameTitles[index]),
              ),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      style: BorderStyle.solid, color: Colors.black12),
                  borderRadius: BorderRadius.circular(0.0))),
        );
      },
    );
  }

  Widget buildCallRecordsLandscape() {}

  Widget favContacts(Orientation orientation) {
    var contactImages = [
      '',
      '',
      'isaac.jpg',

      'acid.jpg',
      'headShot.png',
      'becks.jpg',
      'dorcas.jpg',
      'mbappe.jpg',
      'naomi.png',
      'neymar.jpg',
      'nigeria.jpg',
      'osaka.jpg'
    ];
    var contacts = [
      'Momsy',
      'Dad',
      'Isaac',
      'Acid',
      'Mark',
      'Doken',
      'Dorcas',
      'Mbappe',
      'Naomi',
      'Neymar',
      'Naija',
      'N Osaka'
    ];

    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(contacts.length, (index) {
        return Container(
          decoration: contactImages[index] == ''
              ? getBoxDecorationWithoutImage(contacts[index])
              : getBoxDecorationWithImage(contactImages, index),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  //Icon(Icons.menu, color: Colors.white),
                  createPopUp()
                ],
              ),
              Expanded(
                child: Center(
                    child: Text(
                  contacts[index] == displayName ? displayShortForm : '',
                  style: TextStyle(color: Colors.white, fontSize: 80.0),
                )),
              ),
              ListTile(
                title: Text(
                  contacts[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  BoxDecoration getBoxDecorationWithImage(var contactImages, int index) {
    return BoxDecoration(
      color: Colors.grey,
      border: Border.all(
        color: Colors.white,
      ),
      image: DecorationImage(
          //image: AssetImage('images/isaac.jpg'),
          image: getImage(contactImages[index]),
          fit: BoxFit.cover),
    );
  }

  BoxDecoration getBoxDecorationWithoutImage(var name) {
    print(name);
    displayName = name;
    displayShortForm = displayName.split('')[0];
    return BoxDecoration(
      color: randomColor(),
      border: Border.all(
        color: Colors.white,
      ),
    );
  }

  AssetImage getImage(String imageName) {
    AssetImage image = AssetImage('images/$imageName');
    //print(image.assetName);
    return image; //('images/$imageName');
  }

  Widget createPopUp() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
            PopupMenuItem(
              value: 'option a',
              child: Text('First'),
            ),
            PopupMenuItem(
              value: 'option b',
              child: Text('Second'),
            ),
            PopupMenuItem(
              value: 'option c',
              child: Text('Third'),
            ),
          ],
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }

  Widget _bottomButtons() {
    switch (_tabController.index) {
      case 0:
        return FloatingActionButton(
          onPressed: null,
          child: Icon(
            Icons.dialpad,
            color: Colors.white,
          ),
        );
      //break;
      case 1:
        return FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.dialpad, color: Colors.white),
        );
      case 2:
        return FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.person_add, color: Colors.white),
        );
    }
  }

  FloatingActionButtonLocation _bottomLocation() {
    return _tabController.index == 0
        ? FloatingActionButtonLocation.centerFloat
        : FloatingActionButtonLocation.endFloat;
  }

  Color randomColor() {
    List colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.deepPurple,
      Colors.grey,
      Colors.orange
    ];
    Random random = new Random();
    return colors[random.nextInt(colors.length)];
  }

  Widget contacts() {
    List colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.deepPurple,
      Colors.grey,
      Colors.orange
    ];
    Random random = new Random();
    var contactNames = [
      'Abdulhakim Bashir Kano',
      'Abdulkareem',
      'Abdullahi Aliyu Sajo',
      'Abdulmutallib Degri',
      'Mr Abel',
      'Acct Access NG',
      'Acct FBN',
      'Acid',
      'Adamu',
      'Alex',
      'Alkasim'
    ];
    return
        //Text('A'),

        ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: contactNames[index] == 'Acid'
              ?
         /*
          ClipOval(
                  child: Image(
                    image: AssetImage('images/mbappe.jpg'),
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover, //can also use .fill
                  ),
                )
          */

              CircleAvatar(
                backgroundImage: AssetImage('images/acid.jpg'),
              )

              /* Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/mbappe.jpg'),
                  fit: BoxFit.fill)
                ),
              )
                */

              : RoundedLetter(
                  text: contactNames[index].split('')[0],
                  fontBold: true,
                  shapeColor: colors[random.nextInt(colors.length)],
                ),
          title: Text(contactNames[index]),
        );
      },
    );
    /*
              ListTile(
                leading: RoundedLetter(
                  shapeColor: Colors.red,
                  fontColor: Colors.white,
                  text: 'A',
                  fontBold: true,
                  fontSize: 25,
                  shapeSize: 50,
                ),
                title: Text('Abc'),
              ),
              */
  }
}
