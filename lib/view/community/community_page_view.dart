import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityPageView extends StatelessWidget {
  const CommunityPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '✨정컴이들의 게시판✨',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1,
            color: const Color.fromARGB(255, 12, 12, 12),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '제목',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '내용',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
              ),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Text(
                  '댓글',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
                Text(
                  ' | ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
                Text(
                  '작성시간',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
                Text(
                  ' | ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
                Text(
                  '익명',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                ),
              ]),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
