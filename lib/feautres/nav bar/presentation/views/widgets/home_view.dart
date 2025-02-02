import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child:  ListView(
        children:[
         const CustomSearchField(),
          const SizedBox(height: 20,),
          Image.asset('assets/images/buy.jpg'),
          const SizedBox(height: 20,),
          const Text('Popular Categories',style: TextStyle(
            fontSize: 20,
          ),),
         const SizedBox(height: 20,),
         SizedBox(
          height: 100,
           child: ListView.builder(
            scrollDirection: Axis.horizontal,
             itemCount: categories.length,
             itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     CircleAvatar(
                      radius: 30,
                     
                      backgroundColor: AppColors.kPrimaryColor,
                       child: Icon(categories[index].icon,color: AppColors.kWhiteColor,size: 40,),
                     ),
                     Text(categories[index].title),
                   ],
                 ),
                 
               )  ;
             },
           ),
         ),


        ],
      ),
    );
  }
}
List <Category> categories = [
  Category(icon: Icons.sports, title: 'Sports'),
  Category(icon: Icons.tv, title: 'Electronics'),
  Category(icon: Icons.collections, title: 'Collections'),
  Category(icon: Icons.book, title: 'Books'),
  Category(icon: Icons.games, title: 'Games'),
  Category(icon: Icons.bike_scooter, title: 'Bikes'),

];
class Category{
  final IconData icon;
  final String title;

  Category({required this.icon, required this.title});

}