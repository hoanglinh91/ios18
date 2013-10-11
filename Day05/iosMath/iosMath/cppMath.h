//
//  cppMath.h
//  iosMath
//
//  Created by MAC on 10/12/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//


#ifndef Class__iMath
#define Class__iMath

#endif
class iMath
{
    int x, y;
    float z;
public:
    void setValue (int,int);
    void setValue (float);
    int add ()
    {
        return x + y;
    };
    int sub()
    {
        return x - y;
    };
    int mul()
    {
        return  x * y;
    };
    int div()
    {
        return x / y;
    };
    
    int pow()
    {
        int val = 1;
        for (int i = 0; i < y; i++) {
            val *= x;
        }
        return val;
    };
    
    float fabs(float k)
    {
        return k > 0 ? k : (-k);
    };
    
    float sqrt()
    {
        float hi, lo, mid;
        
        hi = z;
        lo = 1;
        
        while (fabs(hi - lo) > 0.00001) {
            mid = (hi + lo) / 2.0;
            if (mid * mid > z)
                hi = mid;
            else
                lo = mid;
        }
        return mid;
    };
};