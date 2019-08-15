import 'package:flutter/material.dart';

class LayoutsTuts extends StatelessWidget {
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

  Widget buildCallRecordsPotrait(BuildContext context) {
    var nameTitles = [];
    var icons = [
      Icon(
        Icons.account_circle,
        color: Colors.green,
        size: 40.0,
      ),
      /*
      Icon(
        Icons.account_circle,
        color: Colors.red,
        size: 40.0,
      ),
      */

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
          generateList(nameTitles = ['Momsy'], icons),
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
          generateList(nameTitles = ['Acid','Don', 'Dokuran', 'Sarah', 'Tomon'], icons),
        ],
      ),
    );
  }

  ListView generateList(var nameTitles, var icons) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: nameTitles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
              margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
              child: ListTile(
                leading: icons[index],
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
                      '12 min. ago',
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
      'headShot.png',
      'acid.jpg',
      'becks.jpg',
      'dorcas.jpg',
      'isaac.jpg',
      'mbappe.jpg',
      '',
      'naomi.png',
      'neymar.jpg',
      'nigeria.jpg',
      'osaka.jpg'
    ];
    var contacts = [
      'Momsy',
      'Doken',
      'Acid',
      'Mark',
      'Dorcas',
      'Isaac',
      'Mbappe',
      'Dad',
      'Naomi',
      'Neymar',
      'Naija',
      'N Osaka'
    ];

    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(12, (index) {
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
      color: Colors.grey,
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
}
