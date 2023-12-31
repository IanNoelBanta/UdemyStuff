import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  final bool isFavorite;

  @override
  Widget build(context) {
    Widget content = SingleChildScrollView(
      child: Column(
        children: [
          FadeInImage(
            placeholder: MemoryImage(
              kTransparentImage,
            ),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          const SizedBox(
            height: 14,
          ),
          Text('Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 14,
          ),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 14,
          ),
          Text('Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(
            height: 14,
          ),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(step,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
            ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: Icon(Icons.star,
                color: isFavorite == true ? Colors.yellow : Colors.black),
          ),
        ],
      ),
      body: content,
    );
  }
}
