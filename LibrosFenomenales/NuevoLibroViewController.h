//
//  NuevoLibroViewController.h
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LibroFenomenal.h"

@class NuevoLibroViewController;

@protocol NuevoLibroViewControllerDelegate <NSObject>

-(void)nuevoLibroViewController:(NuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro;

@end

@interface NuevoLibroViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nombreTextField;
@property (strong, nonatomic) IBOutlet UITextField *autorTextField;
@property (strong, nonatomic) IBOutlet UITextField *publicadoTextField;
@property (strong, nonatomic) IBOutlet UITextField *generoTextField;
@property (strong, nonatomic) IBOutlet UITextView *argumentoTextView;
@property (strong, nonatomic) IBOutlet UIImageView *portadaImageView;
@property (weak, nonatomic) id <NuevoLibroViewControllerDelegate> delegate;
@property NSMutableArray *libros;

@end
