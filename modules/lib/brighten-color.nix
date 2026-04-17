hexColor: percent: let
  decToHexMap = ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f"];
  hexToDecMap = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    "a" = 10;
    "b" = 11;
    "c" = 12;
    "d" = 13;
    "e" = 14;
    "f" = 15;
    "A" = 10;
    "B" = 11;
    "C" = 12;
    "D" = 13;
    "E" = 14;
    "F" = 15;
  };

  hexToInt = hexStr: let
    char1 = builtins.substring 0 1 hexStr;
    char2 = builtins.substring 1 1 hexStr;
  in
    (hexToDecMap.${char1} * 16) + hexToDecMap.${char2};

  intToHex = intVal: let
    sixteens = intVal / 16;
    remainder = intVal - (sixteens * 16);
  in
    builtins.elemAt decToHexMap sixteens + builtins.elemAt decToHexMap remainder;

  lightenChannel = hexStr: percent: let
    val = hexToInt hexStr;
    roomToWhite = 255 - val;
    increase = (roomToWhite * percent) / 100;
    newVal = val + increase;
  in
    intToHex newVal;

  r = builtins.substring 0 2 hexColor;
  g = builtins.substring 2 2 hexColor;
  b = builtins.substring 4 2 hexColor;
in "${lightenChannel r percent}${lightenChannel g percent}${lightenChannel b percent}"
