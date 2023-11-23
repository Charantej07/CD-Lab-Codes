#include <iostream>
#include <string.h>
using namespace std;
class Parser
{
private:
    string input;
    char *input_ptr;

public:
    Parser()
    {
    }
    Parser(string input)
    {
        this->input = input;
        input_ptr = &input[0];
    }
    bool match(char required)
    {
        if (*input_ptr == required)
        {
            input_ptr++;
            return true;
        }
        else
        {
            return false;
        }
    }
    char get_input_ptr()
    {
        return *input_ptr;
    }
    bool E()
    {
        if (T() && E1())
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    bool E1()
    {
        if (*input_ptr == '+')
        {
            if (match('+') && T() && E1())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        return true;
    }
    bool T()
    {
        if (F() && T1())
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    bool T1()
    {
        if (*input_ptr == '*')
        {
            if (match('*') && F() && T1())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        return true;
    }
    bool F()
    {
        if (*input_ptr == '(')
        {
            if (match('(') && E() && match(')'))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else if (*input_ptr == 'i')
        {
            if (match('i'))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        return false;
    }
};
int main()
{
    string input;
    cout << "Enter the string: ";
    cin >> input;
    Parser p(input);
    if (p.E() && p.get_input_ptr() == '\0')
    {
        cout << "String accepted";
    }
    else
    {
        cout << "String is not accepted";
    }
}