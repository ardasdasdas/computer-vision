function image_histeq(filename)

    % Load the input image
    input_image = imread(filename);
    
    % Check if the input image is grayscale
    if size(input_image, 3) == 3
        input_image = rgb2gray(input_image);
    end
    
    % a. Own histogram equalization algorithm
    output_image_own = histogram_equalization(input_image);
    hist_own = my_imhist(output_image_own);
    
    % b. Built-in histogram equalization function (histeq)
    output_image_histeq = histeq(input_image);
    hist_histeq = imhist(output_image_histeq);
    
    % Display the results
    figure;
    
    % i. Input image and its histogram
    subplot(3, 2, 1);
    imshow(input_image);
    title('Input Image');
    subplot(3, 2, 2);
    bar(my_imhist(input_image));
    title('Histogram of Input Image');
    
    % ii. Output image of your algorithm and its histogram
    subplot(3, 2, 3);
    imshow(output_image_own);
    title('Output Image (Own Algorithm)');
    subplot(3, 2, 4);
    bar(hist_own);
    title('Histogram of Output (Own Algorithm)');
    
    % iii. Output image of histeq function and its histogram
    subplot(3, 2, 5);
    imshow(output_image_histeq);
    title('Output Image (histeq)');
    subplot(3, 2, 6);
    bar(hist_histeq);
    title('Histogram of Output (histeq)');
    
    sgtitle('Histogram Equalization Results');
end

function output_image = histogram_equalization(input_image)
    % Compute the histogram of the input image
    hist_input = my_imhist(input_image);
    
    % Calculate cumulative distribution function (CDF) of the histogram
    cdf = cumsum(hist_input) / numel(input_image);
    
    % Perform histogram equalization
    output_image = uint8(255 * cdf(double(input_image) + 1));
end

function hist = my_imhist(image)
    % Compute the histogram of the input image
    hist = zeros(256, 1);
    [rows, cols] = size(image);
    
    for i = 1:rows
        for j = 1:cols
            intensity = image(i, j) + 1;
            hist(intensity) = hist(intensity) + 1;
        end
    end
end
