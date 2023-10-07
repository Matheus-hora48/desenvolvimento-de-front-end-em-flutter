import 'package:flutter/material.dart';
import 'package:teste_out/src/dto/dto_interface.dart';
import 'package:teste_out/src/entities/about.dart';
import 'package:teste_out/src/entities/activity.dart';
import 'package:teste_out/src/entities/building.dart';
import 'package:teste_out/src/entities/moderator.dart';
import 'package:teste_out/src/entities/opening_hour.dart';
import 'package:teste_out/src/entities/profile.dart';

class DtoBankMock implements DtoInterface {
  @override
  Future<Profile> selectProfile() async {
    return Profile(
      id: 1,
      name: 'Cidade ADM de MG',
      bio: 'Perfil Oficial da Cidade Administrativa de MG ',
      location: 'Cidade administrativa',
      administratorGeneral: 'paulo.oliveira32',
      moderators: [
        Moderator(
          id: 1,
          name: 'oliverpereiraa',
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
        ),
        Moderator(
          id: 2,
          name: '21joaobotelho',
          createAt: DateTime.now(),
          updateAt: DateTime.now(),
        )
      ],
      activities: [
        Activity(
          id: 1,
          author: 'cidadeadm',
          content:
              'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
          comments: [],
          createAt: DateTime.now().subtract(const Duration(days: 12)),
          updateAt: DateTime.now().subtract(const Duration(days: 12)),
        ),
        Activity(
          id: 2,
          author: 'cidadeadm',
          content: 'Lorem ipsum dolor sit amet consectetur.',
          comments: [],
          createAt: DateTime(2023, 5, 10),
          updateAt: DateTime(2023, 5, 10),
        ),
        Activity(
          id: 3,
          author: 'cidadeadm',
          content:
              'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          comments: [],
          createAt: DateTime(2023, 5, 10),
          updateAt: DateTime(2023, 5, 10),
        ),
        Activity(
          id: 4,
          author: 'cidadeadm',
          content:
              'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          comments: [],
          createAt: DateTime(2023, 5, 10),
          updateAt: DateTime(2023, 5, 10),
        ),
        Activity(
          id: 5,
          author: 'cidadeadm',
          content:
              'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          comments: [],
          createAt: DateTime(2023, 5, 10),
          updateAt: DateTime(2023, 5, 10),
        ),
      ],
      about: About(
        id: 1,
        phone: '+55 15 91234-5678',
        email: 'edificiosul@governomg.com.br',
        location: 'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
        buildings: [
          Building(
            id: 1,
            name: 'Edifício Sul',
            photo: 'photo',
            administrator: 'felipeluizz_',
            createAt: DateTime.now(),
            updateAt: DateTime.now(),
          ),
          Building(
            id: 2,
            name: 'Edifício Norte',
            photo: 'photo',
            administrator: 'robertapaula20',
            createAt: DateTime.now(),
            updateAt: DateTime.now(),
          ),
          Building(
            id: 3,
            name: 'Edifício Central',
            photo: 'photo',
            administrator: 'eumunhozricardo',
            createAt: DateTime.now(),
            updateAt: DateTime.now(),
          ),
        ],
        openingHours: [
          OpeningHour(
            id: 1,
            dayOfTheWeek: 'Segunda-feira',
            start: const TimeOfDay(hour: 9, minute: 0),
            end: const TimeOfDay(hour: 17, minute: 0),
            isClosed: false,
          ),
          OpeningHour(
            id: 2,
            dayOfTheWeek: 'Terça-feira',
            start: const TimeOfDay(hour: 9, minute: 0),
            end: const TimeOfDay(hour: 17, minute: 0),
            isClosed: false,
          ),
          OpeningHour(
            id: 3,
            dayOfTheWeek: 'Quarta-feira',
            start: const TimeOfDay(hour: 9, minute: 0),
            end: const TimeOfDay(hour: 17, minute: 0),
            isClosed: false,
          ),
          OpeningHour(
            id: 4,
            dayOfTheWeek: 'Quinta-feira',
            start: const TimeOfDay(hour: 9, minute: 0),
            end: const TimeOfDay(hour: 17, minute: 0),
            isClosed: false,
          ),
          OpeningHour(
            id: 5,
            dayOfTheWeek: 'Sexta-feira',
            start: const TimeOfDay(hour: 9, minute: 0),
            end: const TimeOfDay(hour: 17, minute: 0),
            isClosed: false,
          ),
          OpeningHour(
            id: 6,
            dayOfTheWeek: 'Sábado',
            start: const TimeOfDay(hour: 0, minute: 0),
            end: const TimeOfDay(hour: 0, minute: 0),
            isClosed: true,
          ),
          OpeningHour(
            id: 7,
            dayOfTheWeek: 'Domingo',
            start: const TimeOfDay(hour: 0, minute: 0),
            end: const TimeOfDay(hour: 0, minute: 0),
            isClosed: true,
          ),
        ],
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
      ),
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
      photoBg: 'assets/imgs/photo_bg_profile.png',
    );
  }
}
