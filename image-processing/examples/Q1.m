image1 = randi([0, 255], 100, 100);

% a
intensities = image1(:);
[sorted_values, ~] = sort(intensities, 'descend');  % Ignore sort index
bar(sorted_values);
xlabel('Sorted Pixel Index');
ylabel('Intensity Value');

% b
figure;
histogram(image1(:), 32);
title('Histogram of image1''s Intensities');
xlabel('Intensity');
ylabel('Frequency');

% c

t = 128;

RGB_image = zeros(100, 100, 3); 

RGB_image(:, :, 1) = 255 * (image1 > t); 
RGB_image(:, :, 2) = 0;              
RGB_image(:, :, 3) = 0;              

figure;
imshow(uint8(RGB_image));
title('Color Image with Red where A > t');

% d
X = image1(1:50, 1:50);
figure;
imshow(X, []);
title('Top Left Quadrant of image1');

% e
mean_intensity_image1 = mean(image1(:));
new_image1 = image1 - mean_intensity_image1;
figure;
imshow(new_image1, []);
title('image1 with Mean Intensity Subtracted');

% f
y = [1:12];
z = reshape(y, 4, 3)';
disp('Reshaped matrix y:');
disp(z);

% g
[x, index] = max(image1(:));
[r, c] = ind2sub(size(image1), index);

% h
v = [1, 8, 8, 2, 1, 3, 9, 8];
x = sum(v == 8);
disp('Numberof 8:');
disp(x);