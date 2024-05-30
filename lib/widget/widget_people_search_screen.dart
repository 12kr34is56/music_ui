import 'package:flutter/material.dart';

class Person {
  final String name;
  final int age;
  final String location;
  final String imageUrl;
  bool isFollowing;

  Person({
    required this.name,
    required this.age,
    required this.location,
    required this.imageUrl,
    this.isFollowing = false,
  });
}

class WidgetPeopleSearchScreen extends StatefulWidget {
  const WidgetPeopleSearchScreen({super.key});

  @override
  _WidgetPeopleSearchScreenState createState() =>
      _WidgetPeopleSearchScreenState();
}

class _WidgetPeopleSearchScreenState extends State<WidgetPeopleSearchScreen> {
  final List<Person> _people = List.generate(
    20,
        (index) => Person(
      name: "John Doe",
      age: 30,
      location: "New York",
      imageUrl: "images/profile_image.jpeg",
    ),
  );

  late List<Person> _filteredPeople;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredPeople = _people;
    _searchController.addListener(_filterPeople);
  }

  void _filterPeople() {
    setState(() {
      _filteredPeople = _people
          .where((person) => person.name
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _toggleFollow(Person person) {
    setState(() {
      person.isFollowing = !person.isFollowing;
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _cancelSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _filteredPeople = _people;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _isSearching
                    ? Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                )
                    : const Text(
                  'Members',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: _isSearching ? _cancelSearch : _startSearch,
                  child: !_isSearching
                      ? const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 26,
                  )
                      : const Text("Cancel",style: TextStyle(color: Colors.black,fontSize: 16),),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),  // Prevent ListView from scrolling independently
            itemCount: _filteredPeople.length,
            itemBuilder: (context, index) {
              final person = _filteredPeople[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(person.imageUrl),
                title: Text(person.name),
                subtitle: Text('${person.age} years old, ${person.location}'),
                trailing: TextButton(
                  onPressed: () => _toggleFollow(person),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: person.isFollowing ? Colors.grey : Colors.red,
                  ),
                  child: Text(person.isFollowing ? 'Following' : 'Follow'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
