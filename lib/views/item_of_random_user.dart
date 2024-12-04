import 'package:bloC/models/random_user_list_res.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget itemOfRandomUser(RandomUser randomUser, int index) {
  return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 80,
            width: 80,
            fit: BoxFit.cover,
            imageUrl: randomUser.picture.medium,
            placeholder: (context, url) => Container(
              height: 80,
              width: 80,
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Container(
              height: 80,
              width: 80,
              color: Colors.grey,
              child: const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index} - ${randomUser.name.first} ${randomUser.name.last}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  randomUser.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 16),
                ),
                Text(
                  randomUser.cell,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ));
}
