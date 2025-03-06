import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/core/helper/widgets/product_list.dart';
import 'package:ecommerce_app/core/sensitive_data.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/search_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/categories_list_view.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();

@override
  void initState(){
  PaymentData.initialize(
  apiKey: apiKeyPaymob, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
  iframeId: iframeId, // Required: Found under Developers -> iframes
  integrationCardId: integrationCardId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
  integrationMobileWalletId: integrationMobileWalletId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID

  // Optional User Data
  userData: UserData(
    email: "User Email", // Optional: Defaults to 'NA'
    phone: "User Phone", // Optional: Defaults to 'NA'
    name: "User First Name", // Optional: Defaults to 'NA'
    lastName: "User Last Name", // Optional: Defaults to 'NA'
  ),
  
  //Optional Style Customizations
  style: Style(
    primaryColor: AppColors.kPrimaryColor, // Default: Colors.blue
    scaffoldColor: Colors.white, // Default: Colors.white
    appBarBackgroundColor:AppColors.kPrimaryColor, // Default: Colors.blue
    appBarForegroundColor: Colors.white, // Default: Colors.white
    buttonStyle: ElevatedButton.styleFrom(
      backgroundColor: AppColors.kPrimaryColor,
      foregroundColor: Colors.white
    ), // Default: ElevatedButton.styleFrom()
    circleProgressColor: AppColors.kPrimaryColor, // Default: Colors.blue
    unselectedColor: Colors.grey, // Default: Colors.grey
  ),
);
super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          const SizedBox(height: 20),
            CustomSearchField(
              searchController: searchController,
            onPressed: (){
              if (searchController.text.isNotEmpty) {
                 navigatorTo
                 (context, 
                  SearchView(
              query:searchController.text ,
            )) ;
            searchController.clear();
                
              }
            }
           ),
          const SizedBox(
            height: 15,
          ),
          Image.asset('assets/images/buy.jpg'),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Popular Categories',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const CategoriesList(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Recently Products ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          const ProductList(),
        ],
      ),
    );
  }
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  }
}
