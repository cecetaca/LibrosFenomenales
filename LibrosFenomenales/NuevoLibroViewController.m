//
//  NuevoLibroViewController.m
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero 
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import "NuevoLibroViewController.h"

@interface NuevoLibroViewController ()

@end

@implementation NuevoLibroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)anadirPulsado:(id)sender {
    LibroFenomenal *nuevoLibro = [[LibroFenomenal alloc] init];
    nuevoLibro.nombre = _nombreTextField.text;
    nuevoLibro.autor = _autorTextField.text;
    nuevoLibro.publicado = _publicadoTextField.text;
    nuevoLibro.genero = _generoTextField.text;
    nuevoLibro.argumento = _argumentoTextView.text;
    nuevoLibro.portada = _portadaImageView.image;
    
    [self.delegate nuevoLibroViewController:self haCreadoLibro:nuevoLibro];
}

- (IBAction)cancelarPulsado:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)anadirImagenPulsado:(id)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        _portadaImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }];
    
}

@end
