//
//  cMath.c
//  iosMath
//
//  Created by MAC on 10/11/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#include <stdio.h>
#include "cMath.h"

int iAdd(int a,int b)
{
    return a + b;
}

int iMul(int a,int b)
{
    return a * b;
}


int iDiv(int a,int b)
{
    return a / b;
}


int iSub(int a,int b)
{
    return a - b;
}

int iPow(int a,int b)
{
    int val = a;
    for (int i=1; i<b; i++)
        val *= a;
    return val;
}

float iAbs(float a)
{
    return a < 0 ? (-a) : a;
}

float iSqrt(float a) // binary search
{
    float hi, lo , mid;
    lo = 1;
    hi = a;
    
    while (iAbs(hi - lo) >= 0.00001) {
        mid = (hi + lo) / 2.0;
        if (mid * mid > a)
            hi = mid;
        else
            lo = mid;
    }
    return mid;
}

