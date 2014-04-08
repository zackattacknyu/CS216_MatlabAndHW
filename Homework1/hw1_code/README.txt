Explanation of Zip File:

imageSet: folder of set1 and set2 image files. Included so that the scripts can be run directly. 

CS216_hw1solution.tex: The TeX file of the write-up. 
					   prob5script and prob6script has to be run to generate the images 
					   that are referenced in it. 

prob5script.m: The script that produces the images for problem 5

diceRoll_partF.m: function that simulates rolling a 6 sided die. Part 5F. 

prob6script.m: The script that produces the images and results for problem 6.

getImageSetData.m: Helper function that reads the images in the image set and makes two arrays, 
					a 3-D array of the grayscale image data for all the images
					a 4-D array of the color image data for all the images

writeAverageColorImage.m: function that writes and displays the average color image for a set

writeAverageGrayscaleImage.m: function that writes and displays the average grayscale image for a set

writeStndDevImage.m: function that computes, writes, and displays the standard deviation of the grayscale values




Step to Reproduce the PDF:

1. Go to the folder in Matlab
2. Run prob5script
3. Save the part A plot of intensity values that appears as "prob5partAplot.jpg"
4. Save the part B histogram plot as "prob5partBplot.jpg"
5. Run prob6script
6. Save the color bar plot of standard deviation as "set1grayscaleStndDev_colorbar.jpg"
7. Edit prob6script.m and change the first line so that setname = 'set2'
8. Repeat step 5-6 but save the file as "set2grayscaleStndDev_colorbar.jpg"
9. Open up "CS216_hw1solution.tex" in a LaTeX editor and compile the PDF