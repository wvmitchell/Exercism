module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

expectedMinutesInOven = 40
preparationTimeInMinutes layers = layers * 2
elapsedTimeInMinutes layers timeInOven =
  preparationTimeInMinutes layers + timeInOven
