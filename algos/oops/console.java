unsigned long normalise(unsigned long input_time)
{

    bool finished;

    // This produces a formatted time string like:
    // Thu_Nov_24_18:22:48_1986
    string str_time = format_time( input_time );

    while( str_time.substr(1,3) != "Sun")
    {
        input_time -= 24*60*60;
        str_time = format_time( input_time );
    }

    while( str_time.substr(11,2) != "00" )
    {
        input_time -= 60*60;
        str_time = format_time( input_time );
    }

    while( str_time.substr(14,2) != "00")
    {
        str_time = format_time( input_time );
        input_time -= 60;
    }

    while( str_time.substr(17,2) != "00")
    {
        input_time -= 1;
        str_time = format_time( input_time );
    }

    return input_time;
}

Substring is explained in the .NET reference manual (use MSDN or Google).

this strange piece of code takes a datetime number and tries to find the previous
sunday midnight, using lots of strings: it repeatedly converts to string, then
checks for "Sun" in it, takes away 24 hours, etc; then forces the hour to "00", etc.

Obviously all the while loops are redundant: if the hour is 23, then subtracting 23*60*60
could happen straight away; etc.