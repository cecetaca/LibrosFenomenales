//
//  ViewController.h
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero on 08/09/13.
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"
#import "NuevoLibroViewController.h"

@interface ViewController : UITableViewController <NuevoLibroViewControllerDelegate>

@property NSMutableArray *libros;


@end
