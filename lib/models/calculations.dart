import 'dart:convert';

Calculations calculationsFromJson(String str) => Calculations.fromJson(json.decode(str));

String calculationsToJson(Calculations data) => json.encode(data.toJson());

class Calculations {
    final String index;
    final int floors;
    final String percentage;
    final int totalPopulation;
    final int servedPopulation;
    final Capacity capacity;
    final int velocity;
    final int passengers;
    final int servedFloors;
    final double probableStops;
    final int totalStops;
    final double averageJump;
    final int nominalDevelopedVelocity;
    final double travelTimeForPartialStops;
    final int travelTimeForExpressFloors;
    final double accelerationAndDecelerationTime;
    final int falseStops;
    final double doorOpeningAndClosingTime;
    final double passengerEntryAndExitTime;
    final int levelingTime;
    final double recoveryTime;
    final double totalTime;
    final int passengersToBeTransported;
    final int cabinsRequired;
    final double waitingInterval;

    Calculations({
        required this.index,
        required this.floors,
        required this.percentage,
        required this.totalPopulation,
        required this.servedPopulation,
        required this.capacity,
        required this.velocity,
        required this.passengers,
        required this.servedFloors,
        required this.probableStops,
        required this.totalStops,
        required this.averageJump,
        required this.nominalDevelopedVelocity,
        required this.travelTimeForPartialStops,
        required this.travelTimeForExpressFloors,
        required this.accelerationAndDecelerationTime,
        required this.falseStops,
        required this.doorOpeningAndClosingTime,
        required this.passengerEntryAndExitTime,
        required this.levelingTime,
        required this.recoveryTime,
        required this.totalTime,
        required this.passengersToBeTransported,
        required this.cabinsRequired,
        required this.waitingInterval,
    });

    factory Calculations.fromJson(Map<String, dynamic> json) => Calculations(
        index: json["index"],
        floors: json["floors"],
        percentage: json["percentage"],
        totalPopulation: json["total_population"],
        servedPopulation: json["served_population"],
        capacity: Capacity.fromJson(json["capacity"]),
        velocity: json["velocity"],
        passengers: json["passengers"],
        servedFloors: json["served_floors"],
        probableStops: json["probable_stops"]?.toDouble(),
        totalStops: json["total_stops"],
        averageJump: json["average_jump"]?.toDouble(),
        nominalDevelopedVelocity: json["nominal_developed_velocity"],
        travelTimeForPartialStops: json["travel_time_for_partial_stops"]?.toDouble(),
        travelTimeForExpressFloors: json["travel_time_for_express_floors"],
        accelerationAndDecelerationTime: json["acceleration_and_deceleration_time"]?.toDouble(),
        falseStops: json["false_stops"],
        doorOpeningAndClosingTime: json["door_opening_and_closing_time"]?.toDouble(),
        passengerEntryAndExitTime: json["passenger_entry_and_exit_time"]?.toDouble(),
        levelingTime: json["leveling_time"],
        recoveryTime: json["recovery_time"]?.toDouble(),
        totalTime: json["total_time"]?.toDouble(),
        passengersToBeTransported: json["passengers_to_be_transported"],
        cabinsRequired: json["cabins_required"],
        waitingInterval: json["waiting_interval"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "floors": floors,
        "percentage": percentage,
        "total_population": totalPopulation,
        "served_population": servedPopulation,
        "capacity": capacity.toJson(),
        "velocity": velocity,
        "passengers": passengers,
        "served_floors": servedFloors,
        "probable_stops": probableStops,
        "total_stops": totalStops,
        "average_jump": averageJump,
        "nominal_developed_velocity": nominalDevelopedVelocity,
        "travel_time_for_partial_stops": travelTimeForPartialStops,
        "travel_time_for_express_floors": travelTimeForExpressFloors,
        "acceleration_and_deceleration_time": accelerationAndDecelerationTime,
        "false_stops": falseStops,
        "door_opening_and_closing_time": doorOpeningAndClosingTime,
        "passenger_entry_and_exit_time": passengerEntryAndExitTime,
        "leveling_time": levelingTime,
        "recovery_time": recoveryTime,
        "total_time": totalTime,
        "passengers_to_be_transported": passengersToBeTransported,
        "cabins_required": cabinsRequired,
        "waiting_interval": waitingInterval,
    };
}

class Capacity {
    final int passengers;
    final int kgs;
    final double platformFront;
    final double platformBack;
    final double cubeFront;
    final double cubeBack;
    final double doorWidth;
    final int doorHeight;

    Capacity({
        required this.passengers,
        required this.kgs,
        required this.platformFront,
        required this.platformBack,
        required this.cubeFront,
        required this.cubeBack,
        required this.doorWidth,
        required this.doorHeight,
    });

    factory Capacity.fromJson(Map<String, dynamic> json) => Capacity(
        passengers: json["passengers"],
        kgs: json["kgs"],
        platformFront: json["platform_front"]?.toDouble(),
        platformBack: json["platform_back"]?.toDouble(),
        cubeFront: json["cube_front"]?.toDouble(),
        cubeBack: json["cube_back"]?.toDouble(),
        doorWidth: json["door_width"]?.toDouble(),
        doorHeight: json["door_height"],
    );

    Map<String, dynamic> toJson() => {
        "passengers": passengers,
        "kgs": kgs,
        "platform_front": platformFront,
        "platform_back": platformBack,
        "cube_front": cubeFront,
        "cube_back": cubeBack,
        "door_width": doorWidth,
        "door_height": doorHeight,
    };
}
