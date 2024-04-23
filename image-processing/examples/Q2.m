function neg_img = negative_image(img)
    neg_img = 255 - img;
end

function mirror_img = mirror_image(img)
    mirror_img = fliplr(img);
end

function swapped_img = swap_red_green(img)
    swapped_img = img;
    swapped_img(:,:,1) = img(:,:,2);
    swapped_img(:,:,2) = img(:,:,1);
end

function averaged_img = average_with_mirror(img)
    mirror_img = mirror_image(img);
    averaged_img = uint8((double(img) + double(mirror_img)) / 2);
end

function clipped_img = add_random_value(img)
    random_value = randi([-255, 255], size(img));
    temp_img = double(img) + random_value;
    temp_img(temp_img < 0) = 0;
    temp_img(temp_img > 255) = 255;
    clipped_img = uint8(temp_img);
end

img = imread('example_image.png');
img = rgb2gray(img); 

neg_img = negative_image(img);
mirror_img = mirror_image(img);
swap_rg_img = swap_red_green(imread('example_image.png'));
avg_img = average_with_mirror(img);
rand_img = add_random_value(img);

figure;

subplot(2, 3, 1);
imshow(img);
title('Original Image');

subplot(2, 3, 2);
imshow(neg_img);
title('Negative Image');

subplot(2, 3, 3);
imshow(mirror_img);
title('Mirror Image');

subplot(2, 3, 4);
imshow(swap_rg_img);
title('Swapped Red-Green Channels');

subplot(2, 3, 5);
imshow(avg_img);
title('Average with Mirror Image');

subplot(2, 3, 6);
imshow(rand_img);
title('Random Value Added and Clipped Image');