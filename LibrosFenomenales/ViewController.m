//
//  ViewController.m
//  LibrosFenomenales
//
//  Created by Cecilio César Tamarit Camarero on 08/09/13.
//  Copyright (c) 2013 (Lo que quieras). All rights reserved.
//

#import "ViewController.h"
#import "InformacionLibroViewController.h"
#import "CeldaFenomenal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _libros = [[NSMutableArray alloc] init];
    LibroFenomenal *libro = [[LibroFenomenal alloc] init];
    
    libro.nombre = @"Don Quijote de la Mancha";
    libro.autor = @"Miguel de Cervantes";
    libro.publicado = @"1605";
    libro.genero = @"Parodia";
    libro.portada = [UIImage imageNamed:@"portadaQuijote.jpg"];
    libro.argumento = @"'En un lugar de la Mancha...' Así comienza una de las mayores joyas de la literatura: El Ingenioso Hidalgo Don Quijote de la Mancha. Acompaña al Caballero de la Triste Figura y a Sancho en sus aventuras por la Mancha. Batallas contra gigantes, bálsamos, adargas antiguas, rocines flacos, Dulcinea, condes, ventas y, desde luego, muchas más irracionalidades te esperan de la mano del maestro Cervantes a lo largo de este libro en el que la cordura y la locura están siempre yuxtapuestas.";
    [_libros addObject:libro];
    
    libro = [[LibroFenomenal alloc] init];
    libro.nombre = @"Javi López y la cocinera fenomenal";
    libro.autor = @"Juan K. Hatin'";
    libro.publicado = @"2013";
    libro.genero = @"Fantasía";
    libro.portada = [UIImage imageNamed:@"portadaJavi.png"];
    libro.argumento = @"Javi ha recibido su carta de admisión al 'Peter-Holzensteiner-Gymnasium de Magia Culinaria' y no le han dicho ni a qué clase va, ni su horario. ¿Cómo se organizará? En la Oberstufenestrujen desarrollará su gusto por la comida picante, descubrirá el valor de la amistad y aprenderá a hacer Frikadellen mejor que ningún mago alemán. También se enfrentará al Bundesministerium del Mal y al Kanzler Tenebroso. ¿Conseguirá Javi aprobar el Zaubitur? ¿Aprenderá a declinar correctamente? Sólo hay una respuesta: Immer. ";
    [_libros addObject:libro];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CeldaFenomenal *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CeldaFenomenal *celda = [tableView dequeueReusableCellWithIdentifier:@"Celda"];
    LibroFenomenal *libro = [_libros objectAtIndex:indexPath.row];
    celda.nombreLabel.text = libro.nombre;
    celda.autorLabel.text = libro.autor;
    celda.portadaImageView.image = libro.portada;
    return celda;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_libros count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    InformacionLibroViewController *informacionLibroViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"InformacionLibroViewController"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:informacionLibroViewController];
    informacionLibroViewController.libroSeleccionado = [_libros objectAtIndex:indexPath.row];
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_libros removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segue"]) {
        UINavigationController *navigationController = (UINavigationController *)segue.destinationViewController;
        NuevoLibroViewController *nuevoLibroViewController = (NuevoLibroViewController *)navigationController.topViewController;
        nuevoLibroViewController.libros = _libros;
        nuevoLibroViewController.delegate = self;
    }
}

-(void)nuevoLibroViewController:(NuevoLibroViewController *)controller haCreadoLibro:(LibroFenomenal *)nuevoLibro {
    int nuevaFila = [_libros count];
    [_libros addObject:nuevoLibro];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:nuevaFila inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
