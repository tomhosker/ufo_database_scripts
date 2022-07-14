-- This code adds some example data to our prototype spatial database.

DROP TABLE IF EXISTS example_spatial;

CREATE TABLE example_spatial (
    id SERIAL PRIMARY KEY,
    image_name VARCHAR(999),
    geom geometry
);

INSERT INTO example_spatial (image_name, geom)
VALUES (
    'Ladybug-Stream-20220526-100712_Panoramic_006268_right.jpg',
    'POLYGON ((305383.50244248216 208368.44440931012, 305364.11256500555 208403.43058734882, 305361.2896555845 208401.7098884227, 305358.61848202127 208399.76195253868, 305356.11729114025 208397.6000860848, 305353.803168611 208395.23905679066, 305351.69192223693 208392.69499288744, 305349.79797397164 208389.98527290765, 305348.134261402 208387.12840698718, 305346.71214937215 208384.14391041908, 305345.54135234904 208381.05217033782, 305344.6298680635 208377.87430646422, 305343.98392287776 208374.6320268322, 305343.607929252 208371.34747949598, 305343.50445560407 208368.0431012496, 305343.67420876387 208364.7414643453, 305344.1160291455 208361.46512230666, 305344.82689866744 208358.23645587487, 305345.80196137005 208355.07752011705, 305347.0345565865 208352.009893767, 305348.5162644414 208349.05453182227, 305383.50244248216 208368.44440931012))'
);