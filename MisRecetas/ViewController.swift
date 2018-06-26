//
//  ViewController.swift
//  MisRecetas
//
//  Created by Alejandro Ruiz Ponce on 19/6/18.
//  Copyright © 2018 Alejandro Ruiz Ponce. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = true
        

        
        var recipe = Recipe(name: "Tortilla de patatas",
                            image: #imageLiteral(resourceName: "tortilla"),
                            time: 180,
                            ingredients: ["Patatas", "Huevos", "Cebolla"],
                            steps: ["1.Cortar las patatas",
                                    "2.Batir los huevos",
                                    "3.Echar las patatas",
                                    "4.Freir la tortilla"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza",
                        image: #imageLiteral(resourceName: "pizza"),
                        time: 20,
                        ingredients: ["Harina", "Huevos", "Tomates", "Queso", "Mozzarella", "Oregano"],
                        steps: ["1.Hacemos la masa con la harina",
                                "2.Reposar la masa 30 minutos",
                                "3.Extender la masa y echar ingredientes",
                                "4.Hornear durante 20 minutos"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tarta de manzana",
                        image: #imageLiteral(resourceName: "tartamanzana"),
                        time: 300,
                        ingredients: ["Harina", "Leche", "Levadura", "Huevos", "Manzanas"],
                        steps: ["1.Poner en un bol la masa con leche",
                                "2.Dar forma y echar los ingredientes",
                                "3.Cortar las manzanas y trocearlas por la tarta",
                                "4.Hornear el bizcocho y enfriar"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada cesar",
                        image: #imageLiteral(resourceName: "ensalada"),
                        time: 15,
                        ingredients: ["Lechuga", "Queso", "Tomate", "Aceite", "Salsa cesar"],
                        steps: ["1.Trocear la lechuga",
                                "2.Echar queso, tomate, aceite y salsa al gusto",
                                "3.Aliñar correctamente",
                                "4.Comer y servir"])
        recipes.append(recipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        cell.nameRecipe.text = recipe.name
        cell.imageRecipe.image = recipe.image!
        cell.ingredientsRecipe.text = "Ingredientes: \(recipe.ingredients.count)"
        cell.timeRecipe.text = ("\(recipe.time!) mins")
        
        if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        //cell.imageRecipe.layer.cornerRadius = 42.0
        //cell.imageRecipe.clipsToBounds = true
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let recipe = recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTittle = "Marcar Favorita"
        if recipe.isFavourite {
            favouriteActionTittle = "Desmarcar"
        }
        
        let favouriteAction = UIAlertAction(title: favouriteActionTittle, style: .default) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)*/
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
                let shareDefaultText = "Estoy mirando la receta \(self.recipes[indexPath.row].name) en la App del curso."
            
                let activityController = UIActivityViewController(activityItems: [shareDefaultText], applicationActivities: nil)
            
                self.present(activityController, animated: true, completion: nil)
            }
        shareAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        //Delete
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (deleteAction, indexPath) in
                self.recipes.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [shareAction, deleteAction]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }

}

