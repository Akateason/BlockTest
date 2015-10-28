//
//  ViewController.m
//  BlockTest
//
//  Created by TuTu on 15/10/28.
//  Copyright © 2015年 teason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//   eg1
    // Defining a block variable
    BOOL (^isInputEven)(int) = ^(int input) {
        if (input % 2 == 0) {
            return YES;
        } else {
            return NO;
        }
    } ;
    int x = 33;
    NSLog(@"%d %@ number", x, isInputEven(x) ? @"is an even" : @"is not an even");

    
//    eg2
    float price = 1.99 ;
    float (^finalPrice)(int) = ^(int quantity) {
        // Notice local variable price is
        // accessible in the block
        return quantity * price ;
    } ;
    int orderQuantity = 10 ;
    NSLog(@"Ordering %d units, final price is: $%2.2f", orderQuantity, finalPrice(orderQuantity)) ;

    
//    eg3
    // Use the __block storage modifier to allow changes to 'price'
    __block float price2 = 1.99;
    float (^finalPrice2)(int) = ^(int quantity2) {
        return quantity2 * price2;
    };
    
    int orderQuantity2 = 10;
    price2 = .99;
    
    NSLog(@"With block storage modifier - Ordering %d units, final price is: $%2.2f", orderQuantity2, finalPrice2(orderQuantity2));
    
    
//     eg 4
    typedef double (^myBlockOperation)(double op) ;
    
    myBlockOperation square ;
    square = ^(double operand) {
        return operand * operand ;
    } ;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
