//
//  InformacionLibroViewController.m
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero on 15/09/13.
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import "InformacionLibroViewController.h"
#import <Social/Social.h>

@interface InformacionLibroViewController ()

@end

@implementation InformacionLibroViewController

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
	_nombreLabel.text = _libroSeleccionado.nombre;
    _autorLabel.text = _libroSeleccionado.autor;
    _publicadoLabel.text = _libroSeleccionado.publicado;
    _generoLabel.text = _libroSeleccionado.genero;
    _portadaImageView.image = _libroSeleccionado.portada;
    _argumentoTextView.text = _libroSeleccionado.argumento;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atrasButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)compartirButton:(id)sender {
    NSString *textoPorCompartir = [NSString stringWithFormat:@"¡Mira este fenomenal libro llamado %@! #DesarrollarAppsEsFenomenal", _libroSeleccionado.nombre];
    NSArray *cosasPorCompartir  = @[textoPorCompartir, _libroSeleccionado.portada];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:cosasPorCompartir applicationActivities:nil];
    [self presentViewController:activityViewController animated:YES completion:nil];
}

@end
