import 'package:flutter/material.dart';
import 'package:instagram_memes/utils/constants.dart';

class ListButtonsFilterWidget extends StatefulWidget {
  const ListButtonsFilterWidget({super.key});

  @override
  State<ListButtonsFilterWidget> createState() =>
      _ListButtonsFilterWidgetState();
}

enum Filters { popular, mostDownloaded, animals, all }

class _ListButtonsFilterWidgetState extends State<ListButtonsFilterWidget> {
  Filters filterSelected = Filters.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SegmentedButton<Filters>(
            showSelectedIcon: false,
            selected: {filterSelected},
            segments: [
              ButtonSegment(
                value: Filters.all,
                label: Text(
                  'Todos',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.myTheme.primary,
                  ),
                ),
                icon: Icon(
                  Icons.all_inclusive,
                  color: context.myTheme.primary,
                ),
              ),
              ButtonSegment(
                value: Filters.popular,
                label: Text(
                  'Popular',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.myTheme.primary,
                  ),
                ),
                icon: Icon(
                  Icons.star_rounded,
                  color: context.myTheme.primary,
                ),
              ),
              ButtonSegment(
                value: Filters.mostDownloaded,
                label: Text(
                  'Mais Baixados',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.myTheme.primary,
                  ),
                ),
                icon: Icon(
                  Icons.download_done_rounded,
                  color: context.myTheme.primary,
                ),
              ),
              ButtonSegment(
                value: Filters.animals,
                label: Text(
                  'Animals',
                  style: context.textTheme.labelLarge!.copyWith(
                    color: context.myTheme.primary,
                  ),
                ),
                icon: Icon(
                  Icons.pets,
                  color: context.myTheme.primary,
                ),
              ),
            ],
            onSelectionChanged: (Set<Filters> newSelection) {
              setState(() {
                filterSelected = newSelection.first;
              });
            },
          )
        ],
      ),
    );
  }
}
