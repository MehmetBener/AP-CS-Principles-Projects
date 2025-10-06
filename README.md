# NOTES

### Quiz 2.2

**Question:** Directions: The question or incomplete statement below is followed by four suggested answers or completions. Select the one that is best in each case.

Digital images are often represented by the red, green, and blue values (an RGB triplet) of each individual pixel in the image. A photographer is manipulating a digital image and overwriting the original image. Which of the following describes a lossless transformation of the digital image?

**Incorrect answer:** Modifying part of the image by taking the pixels in one part of the picture and copying them to the pixels in another part of the picture.

I thought this answer meant labeling each pixel with its RGB value, and because the pixels with the same label will be the same bit, the data would be compressed with no loss. 

**Correct answer:** Creating the negative of an image by creating a new RGB triplet for each pixel in which each value is calculated by subtracting the original value from 255. The negative of an image is reversed from the original; light areas appear dark, and colors are reversed.

I knew there was no loss here but I thought this would not compress the data and I was correct but the question asked for lossless transformation, not for lossless compression.

**Key takeaway:** Difference between data tranformation and compression. 
