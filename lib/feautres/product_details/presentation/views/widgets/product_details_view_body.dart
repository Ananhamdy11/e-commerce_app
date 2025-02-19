import 'package:ecommerce_app/core/app_colors.dart';
import 'package:ecommerce_app/core/helper/product_model/product_model.dart';
import 'package:ecommerce_app/core/helper/widgets/cached_image.dart';
import 'package:ecommerce_app/feautres/auth/presentation/mangers/cubit/authentacation_cubit.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/manager/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/product_details_view.dart';
import 'package:ecommerce_app/feautres/product_details/presentation/views/widgets/user_comments_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final TextEditingController feedbackController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()..getRates(productId: widget.productModel.productId!),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if(state is AddOrUpdateRateSuccess){
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>  ProductDetailsView(productModel: widget.productModel,)
            ));

          }
        },
        builder: (context, state) {
          ProductDetailsCubit cubit=context.read<ProductDetailsCubit>();
          return state is GetRateLoading || state is AddCommentsLoading ? const Center(child:  CircularProgressIndicator()) : ListView(
            children: [
              CachednetworkImage(
                  url: widget.productModel.imageUrl ??
                      'https://img.freepik.com/premium-psd/isolated-smart-tv-monitor-home-office-entertainment_92267-199.jpg?w=996'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.productModel.productName!),
                        Text('${widget.productModel.price}LE')
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("${cubit.averageRate}"),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            )
                          ],
                        ),
                        const Icon(
                          Icons.favorite,
                          color: AppColors.kGreyColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(widget.productModel.description ?? 'Product description'),
                    const SizedBox(
                      height: 20,
                    ),
                    RatingBar.builder(
                      initialRating: cubit.userRate.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        cubit.addOrUpdateUserRate(productId: widget.productModel.productId!, data: 
                        {
                          "rate": rating.toInt(),
                          "for_user": cubit.userId,
                          "for_product":widget.productModel.productId
                        }
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: feedbackController,
                      label: 'Type Your Feedback ',
                      keyboardType: TextInputType.multiline,
                      suffixIcon: IconButton(
                        onPressed: () async{
                         await cubit.addComments(data: {
        "comment": feedbackController.text,
        "for_user": cubit.userId,
        "for_product": widget.productModel.productId,
        "user_name":context.read<AuthentacationCubit>().userDataModel?.name ??"User Name"
    });
    feedbackController.clear();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                     UserCommentsListView(productModel: widget.productModel,),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose(){
    feedbackController.dispose();
    super.dispose();
  }
}
