A = rgb2gray(imread('modifiedImageProb5.jpg'));
A = im2double(A);

%Part A
singleVectorA = A(:);
sortedValuesA = sort(singleVectorA);
figure
plot(sortedValuesA);
xlabel('Entry Number in Sorted Vector');
ylabel('Intensity Value');
title('Problem 5, Part A plot of sorted intensity values');