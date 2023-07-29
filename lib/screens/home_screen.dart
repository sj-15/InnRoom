import 'package:flutter/material.dart';
import 'package:innroom/components/home_background.dart';
import 'package:innroom/components/home_foreground.dart';
import 'package:innroom/widgets/hotelcard.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const HomeBackground(),
                const Positioned(
                  left: 5,
                  top: 0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'InnRoom', // Replace with your company name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.4,
                  top: 50,
                  child: const Text(
                    'Welcome to InnRoom',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 120,
                  top: 16,
                  child: InkWell(
                    child: const Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: InkWell(
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Favorite',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                const HomeForeground(),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Explore Our Best Collection',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              height: size.height * 0.9,
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HotelCard(
                          hotelName: "Golden Horizon Hotel",
                          location: "New York, USA",
                          rating: 5,
                          imageUrls: [
                            'https://images.pexels.com/photos/1134176/pexels-photo-1134176.jpeg',
                            'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600',
                            'https://images.pexels.com/photos/1457847/pexels-photo-1457847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                          ],
                        ),
                        HotelCard(
                          hotelName: "Golden Horizon Hotel",
                          location: "New York, USA",
                          rating: 5,
                          imageUrls: [
                            'https://images.pexels.com/photos/1134176/pexels-photo-1134176.jpeg',
                            'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=600',
                            'https://images.pexels.com/photos/1457847/pexels-photo-1457847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
