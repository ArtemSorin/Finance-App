import 'package:finance_app/screens/businesschat.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText: "Awesome Setup",
        image: "images/userImage1.jpeg",
        time: "Now"),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "That's Great",
        image: "images/userImage2.jpeg",
        time: "Yesterday"),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey where are you?",
        image: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Busy! Call me in 20 mins",
        image: "images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        text: "Debra Hawkins",
        secondaryText: "Thankyou, It's awesome",
        image: "images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey where are you?",
        image: "images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Busy! Call me in 20 mins",
        image: "images/userImage4.jpeg",
        time: "28 Mar"),
  ];
  @override
  Widget build(BuildContext context) {
    return (SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Message",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 91, 117, 240),
                      shape: const StadiumBorder()),
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "Add new",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.grey.shade600,
                  onPressed: (() {}),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 91, 117, 240),
                  child: Text('O'),
                ),
                title: Text(chatUsers[index].text),
                subtitle: Text(chatUsers[index].secondaryText),
                onTap: () => {},
                trailing: Text(chatUsers[index].time),
              );
            },
            itemCount: chatUsers.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ],
      ),
    ));
  }
}
