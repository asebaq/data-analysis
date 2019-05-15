clear, close, clc;

all_points = 1000;
point_inside = 0;

img = imbinarize(rgb2gray(imread('area.png')));

img_height = size(img, 1);
img_width = size(img, 2);

imshow(img);

hold on
for i = 1:all_points
    x = randi(img_width);
    y = randi(img_height);
    if img(y, x) == 0
        plot(x,y,'*', 'Color', 'r');
        point_inside = point_inside +1;
    else
        plot(x,y,'o', 'Color', 'b');
    end
end

scale = 5;
area = img_width*img_height*point_inside/all_points*scale;
