//
//  InformacionLibroViewController.h
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero on 15/09/13.
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

@interface InformacionLibroViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *nombreLabel;
@property (strong, nonatomic) IBOutlet UILabel *autorLabel;
@property (strong, nonatomic) IBOutlet UILabel *publicadoLabel;
@property (strong, nonatomic) IBOutlet UILabel *generoLabel;
@property (strong, nonatomic) IBOutlet UITextView *argumentoTextView;
@property (strong, nonatomic) IBOutlet UIImageView *portadaImageView;
@property LibroFenomenal *libroSeleccionado;

@end
