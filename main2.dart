import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTopBar(),
              SizedBox(height: 30),
              _buildCategorySection(),
              SizedBox(height: 20),
              _buildVoiceGrid(),
              Spacer(),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('STEP 1', style: TextStyle(color: Colors.white, fontSize: 16)),
        IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            // Close the screen
          },
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pick Your New Voice',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Choose one of the voices to be used for your cover.',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _categoryChip('All', true),
              _categoryChip('Hot', false),
              _categoryChip('Musicians', false),
              _categoryChip('Film', false),
              _categoryChip('Featured', false),
              _categoryChip('wtf', false),
              _categoryChip('Leaders', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryChip(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: selected ? Colors.purple : Colors.grey[800],
        labelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildVoiceGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: List.generate(6, (index) {
          return Card(
            color: Colors.grey[850],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://placehold.co/100x100?description=Placeholder%20Image%20${index + 1}',
                  width: 100,
                  height: 100,
                ),
                Text('Voice ${index + 1}',
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: () {
        // Proceed to the next step
      },
      child: Text('Continue'),
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }
}
