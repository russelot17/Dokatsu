import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './dog_breed_detail.dart';
import '/models/DogBreed.dart';

class DogBreedTile extends StatelessWidget {
  final DogBreed breed;

  const DogBreedTile(this.breed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DogBreedDetail(breed)),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: breed.image.firstWhere((url) => url.isNotEmpty,
                              orElse: () => '') ==
                          ''
                      ? Image.asset('assets/images/Dokatsu Logo.png',
                          fit: BoxFit.cover)
                      : CachedNetworkImage(
                          imageUrl:
                              breed.image.firstWhere((url) => url.isNotEmpty),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        )),
              SizedBox(height: 8),
              Text(
                breed.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
