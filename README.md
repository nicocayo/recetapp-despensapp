# README

----------------------------------------------------------------------------------------------------
Model Relationships
----------------------------------------------------------------------------------------------------
Product

belongs_to Category: Each product can be categorized (e.g., fruit, vegetable).
has_many Ingredients: A product can be used in multiple recipes as different ingredients.
has_many Recipes, through: Ingredients: This allows you to find all recipes that use a specific product.
----------------------------------------------------------------------------------------------------
Category

has_many Products: Each category can contain multiple products (e.g., "Fruit" category has apples, bananas, etc.).
dependent: : If a category is deleted, the associated products won't be deleted, but their category_id will be set to null.
----------------------------------------------------------------------------------------------------
Recipe

has_many Ingredients: A recipe consists of multiple ingredients.
has_many Products, through: Ingredients: This allows you to find all products needed for a recipe.
has_many Meals: A recipe can be used in multiple meal plans.
has_many MealPlans, through: Meals: This helps track which meal plans include this recipe.
----------------------------------------------------------------------------------------------------
Ingredient

belongs_to Product: Links an ingredient to the actual product in your pantry.
belongs_to Recipe: Associates the ingredient with a specific recipe.
----------------------------------------------------------------------------------------------------
MealPlan

has_many Meals: A meal plan consists of multiple individual meals.
has_many Recipes, through: : This allows you to find all recipes in a meal plan.
----------------------------------------------------------------------------------------------------
Meal

belongs_to : Each meal is part of a meal plan.
belongs_to : Each meal is made using a specific recipe.
----------------------------------------------------------------------------------------------------
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
