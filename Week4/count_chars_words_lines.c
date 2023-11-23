#include <stdio.h>
int main()
{
    char filename[100];
    printf("Enter the name of the file: ");
    scanf("%s", filename);
    printf("%s", filename);
    FILE *file = fopen(filename, "r");
    if (file == NULL)
    {
        printf("Unable to open the file. Exiting...\n");
        return 1;
    }
    int no_of_chars = 0;
    int no_of_words = 0;
    int no_of_lines = 0;
    int in_word = 0;
    char ch;
    while ((ch = fgetc(file)) != EOF)
    {
        no_of_chars++;
        if (ch != ' ' && ch != '\t' && ch != '\n' && ch != '\r' && ch != '\f' && ch != '\v')
        {
            in_word = 1;
        }
        if ((ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' || ch == '\f' || ch == '\v') &&
            in_word)
        {
            no_of_words++;
            in_word = 0;
        }
        if (ch == '\n' || ch == '\0')
        {
            no_of_lines++;
        }
    }
    fclose(file);
    printf("Number of characters: %d\n", no_of_chars);
    printf("Number of words: %d\n", no_of_words);
    printf("Number of lines: %d\n", no_of_lines);
    return 0;
}