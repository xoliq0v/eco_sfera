import 'package:app_bloc/app_bloc.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  
  @override
  void initState() {
    super.initState();
    context.read<PartnerCommentCubit>().getComments();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<PartnerCommentCubit>().getComments();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnerCommentCubit,PartnerCommentState>(
      builder: (context,state){
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          success: (comments) => ListView.builder(
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
                child: _Item(
                  description: comments[index].description,
                  title: switch(context.locale){
                    Locale(languageCode: 'uz') => comments[index].partnerProduct.name,
                    Locale(languageCode: 'ru') => comments[index].partnerProduct.nameRu,
                    Locale(languageCode: 'en') => comments[index].partnerProduct.nameEn,
                    _ => comments[index].partnerProduct.name,
                  },
                  icon: 'assets/icons/box.svg'),
              );
            },
            itemCount: comments.length,
          ),
          loading: () => const Center(child: CircularProgressIndicator.adaptive()),
          error: (message) => Center(child: Text(message)),
          initial: () => const Center(child: CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}


class _Item extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  const _Item({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: context.colorScheme.primary.withOpacity(0.3)),
        ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 15),
        child: Row(
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                child: SvgPicture.asset(icon,color: context.colorScheme.secondary,),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),),
                  Text(description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
