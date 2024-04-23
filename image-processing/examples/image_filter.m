function image_filter(filename)
    % Load the input image
    input_image = imread(filename);
    
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    % a
    output_image_own = my_averaging_filter(input_image);
    
    % b
    filter_matrix = ones(3, 3) / 9;  % 3x3 averaging filter
    output_image_filter2 = filter2(filter_matrix, input_image);
    
    figure;
    
    % i
    subplot(2, 2, 1);
    imshow(input_image);
    title('Input Image');
    
    % ii
    subplot(2, 2, 2);
    imshow(output_image_own, []);
    title('Output Image (Own Algorithm)');
    
    % iii
    subplot(2, 2, 3);
    imshow(output_image_filter2, []);
    title('Output Image (filter2)');
end

function output_image = my_averaging_filter(input_image)
    [rows, cols] = size(input_image);
    output_image = zeros(rows, cols);
    
    for i = 2:rows-1
        for j = 2:cols-1
            output_image(i, j) = mean2(input_image(i-1:i+1, j-1:j+1));
        end
    end
    output_image = uint8(output_image);
end
