#include <iostream>
using namespace std;
int main()
{
    string input;
    cin >> input;
    int state = 0;
    for (int i = 0; input[i] != '\0'; i++)
    {
        if (input[i] == '0')
        {
            if (state == 0)
            {
                state = 1;
            }
            else if (state == 1)
            {
                state = 0;
            }
            else if (state == 2)
            {

                state = 3;
            }
            else if (state == 3)
            {
                state = 2;
            }
        }
        else if (input[i] == '1')
        {
            if (state == 0)
            {
                state = 3;
            }
            else if (state == 1)
            {
                state = 2;
            }
            else if (state == 2)
            {

                state = 1;
            }
            else if (state == 3)
            {
                state = 0;
            }
        }
        else
        {
            cout << "Invlaid input" << endl;
            return 0;
        }
    }
    if (state == 0)
    {
        cout << "The string is accepted";
    }
    else
    {
        cout << "The string is not accepted";
    }
}