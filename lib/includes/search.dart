import 'package:flutter/material.dart';
import 'package:mbrella/home.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = true;
  final List<String> _searchHistory = ["Men items", "Ladies items", "Home decoration", 'Kid items', 'Black pant'];
  List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.yellow.withOpacity(0.5),

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.yellow.withOpacity(0.3)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          title: _isSearching ? _buildSearchField() : null,
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: _buildBody(),
      ),

    );
  }
  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear,color: Colors.red,),
          onPressed: () {
            _searchController.clear();
            setState(() {
              _suggestions.clear();
            });
          },
        ),
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          _search(value);
        } else {
          setState(() {
            _suggestions.clear();
          });
        }
      },
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return [
        IconButton(
          icon: const Icon(Icons.cancel,color: Colors.black),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
              _suggestions.clear();
            });
          },
        ),
      ];
    } else {
      return [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
      ];
    }
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_suggestions.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                    border:  Border(
                      left: BorderSide( color: Colors.orange.withOpacity(0.3),  width: 10.0),
                      // top: BorderSide( color: Colors.blue,  width: 1),
                      bottom: BorderSide( color: Colors.orange.withOpacity(0.3),  width: 1),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 3.0,
                        height: 60.0, // Adjust height if needed
                        color: Colors.yellow.withOpacity(0.3),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(_suggestions[index], style: const TextStyle(color: Colors.black)),
                          onTap: () {
                            _onSuggestionSelected(_suggestions[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        if (_searchHistory.isNotEmpty && _isSearching == true) ...[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Recent Searches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Wrap(
            spacing: 8.0,
            children: _buildHistoryButtons(),
          ),
        ],
      ],
    );
  }

  List<Widget> _buildHistoryButtons() {
    return _searchHistory.map((search) {
      return ElevatedButton(
        onPressed: () {
          _onHistorySelected(search);
        },
        child: Text(search),
      );
    }).toList();
  }

  void _search(String keyword) {
    // Simulate API call or implement actual API integration here
    // For demo, just filtering the search history based on keyword
    setState(() {
      _suggestions = _searchHistory.where((item) => item.toLowerCase().contains(keyword.toLowerCase())).toList();
    });
  }

  void _onSuggestionSelected(String suggestion) {
    // Handle suggestion selection
    _navigateToSearchResults(suggestion);
  }

  void _onHistorySelected(String history) {
    // Handle history selection
    _navigateToSearchResults(history);
  }

  void _navigateToSearchResults(String query) {
    // Navigate to search results page or perform search operation
    print("Searching for: $query");

  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

}