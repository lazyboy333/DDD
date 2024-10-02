CREATE TABLE User (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
  );

CREATE TABLE Published (
    recipeID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT NOT NULL,
    Name VARCHAR(100) NOT NULL,
    instructions TEXT NOT NULL,
    FOREIGN KEY (userID) REFERENCES User(userID),
    CHECK (recipeName <> '') 
);

CREATE TABLE Favorites (
    userID INT NOT NULL,
    recipeID INT NOT NULL,
    PRIMARY KEY (userID, recipeID),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (recipeID) REFERENCES PublishedRecipe(recipeID)
);
CREATE TABLE Recipe (
    recipeID INT AUTO_INCREMENT PRIMARY KEY,
    recipeName VARCHAR(100) NOT NULL,
    instructions TEXT NOT NULL,
    type ENUM('Breakfast', 'Lunch', 'Dinner', 'Other') NOT NULL,
    rating DECIMAL(3,1) DEFAULT 0.0, 
    CHECK (instructions <> ''), 
    CHECK (Name <> '') 
);

CREATE TABLE Breakfast (
    recipeID INT PRIMARY KEY,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

CREATE TABLE Lunch (
    recipeID INT PRIMARY KEY,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

CREATE TABLE Dinner (
    recipeID INT PRIMARY KEY,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

CREATE TABLE Other (
    recipeID INT PRIMARY KEY,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID)
);

--User and password
CREATE TABLE User (
    userID INT AUTO_INCREMENT PRIMARY KEY,
);

CREATE TABLE Password (
    userID INT NOT NULL,
    password VARCHAR(100) NOT NULL,
    FOREIGN KEY (userID) REFERENCES User(userID) ON DELETE CASCADE
);
--Recipe no ISA
CREATE TABLE Recipe (
    recipeID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Name (
    recipeID INT NOT NULL,
    recipeName VARCHAR(100) NOT NULL,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID) ON DELETE CASCADE
);

CREATE TABLE Rating (
    recipeID INT NOT NULL,
    rating DECIMAL(3,1) NOT NULL CHECK (rating BETWEEN 0 AND 10),
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID) ON DELETE CASCADE
);

CREATE TABLE Instructions (
    recipeID INT NOT NULL,
    instructions TEXT NOT NULL,
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID) ON DELETE CASCADE
);

CREATE TABLE Ingredients (
    recipeID INT NOT NULL,
    ingredientID INT NOT NULL,
    PRIMARY KEY (recipeID, ingredientID),
    FOREIGN KEY (recipeID) REFERENCES Recipe(recipeID) ON DELETE CASCADE,
    FOREIGN KEY (ingredientID) REFERENCES Ingredient(ingredientID)
);
--Ingredients ISA
CREATE TABLE Ingredients (
    ingredientID INT AUTO_INCREMENT PRIMARY KEY,
    ingredientName VARCHAR(100) NOT NULL
);
CREATE TABLE Pantry (
    ingredientID INT PRIMARY KEY,
    FOREIGN KEY (ingredientID) REFERENCES Ingredients(ingredientID) ON DELETE CASCADE
);

CREATE TABLE FridgeLasting (
    ingredientID INT PRIMARY KEY,
    FOREIGN KEY (ingredientID) REFERENCES Ingredients(ingredientID) ON DELETE CASCADE
);

CREATE TABLE FridgeUnlasting (
    ingredientID INT PRIMARY KEY,
    FOREIGN KEY (ingredientID) REFERENCES Ingredients(ingredientID) ON DELETE CASCADE
);