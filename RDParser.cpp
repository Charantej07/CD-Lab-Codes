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
    Parser(string str)
    {
        input = str;
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
    bool F()
    {
        if (*input_ptr == '(')
        {
            if (match('(') && Start() && match(')'))
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
    bool T()
    {
        if (F() && T1())
        {
            return true;
        }
        return false;
    }
    bool E1()
    {
        if (*input_ptr == '+')
        {
            if (match('+') && T() && E1())
            {
                return true;
            }
            return false;
        }
        return true;
    }
    bool Start()
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
    char get_input_ptr()
    {
        return *input_ptr;
    }
};
int main()
{
    string input;
    cout << "Enter the string: ";
    cin >> input;
    Parser Rd_Parser(input);
    if (Rd_Parser.Start() && Rd_Parser.get_input_ptr() == '\0')
    {
        cout << "SYNTACTICALLY CORRECT" << endl;
    }
    else
    {
        cout << "SYNTACTICALLY INCORRECT";
    }
    return 1;
}